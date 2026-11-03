sudo su -
---------------

yum install amazon-cloudwatch-agent -y
---------------

sudo vi /opt/aws/amazon-cloudwatch-agent/bin/config.json

---------------

{
  "agent": {
    "run_as_user": "root"
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/*",
            "log_group_name": "ec2-all-logs",
            "log_stream_name": "{instance_id}-all-logs",
            "timezone": "Local"
          }
        ]
      }
    }
  }
}



| Code                    | Simple meaning                          |
| --------------------------------- | --------------------------------------- |
| `agent`                 | CloudWatch Agent settings               |
| `run_as_user: root`     | Run agent as root user                  |
| `logs`                  | Enable log collection                   |
| `logs_collected`        | Define logs to collect                  |
| `files`                 | Collect logs from files                 |
| `collect_list`          | List of log files                       |
| `file_path: /var/log/*` | Collect matching files from `/var/log/` |
| `log_group_name`        | CloudWatch folder name                  |
| `log_stream_name`       | Log stream name using EC2 instance ID   |
| `timezone: Local`       | Use EC2 local timezone                  |


In one sentence: CloudWatch Agent reads EC2 log files from `/var/log/` and sends them to the `ec2-all-logs` Log Group in AWS CloudWatch.

---------------

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a fetch-config \
-m ec2 \
-c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json \
-s


This command is used to start the Amazon CloudWatch Agent on your EC2 instance using the JSON configuration file.

In simple words: This command connects your EC2 logs to AWS CloudWatch so you can monitor and troubleshoot your server logs from the AWS Console.




---------------
Correct command to check CloudWatch Agent using `systemctl`:

1\. Check service status

```
sudo systemctl status amazon-cloudwatch-agent
```

2\. Start agent

```
sudo systemctl start amazon-cloudwatch-agent
```

3\. Stop agent

```
sudo systemctl stop amazon-cloudwatch-agent
```

4\. Restart agent

```
sudo systemctl restart amazon-cloudwatch-agent
```

5\. Enable agent at system boot

```
sudo systemctl enable amazon-cloudwatch-agent
```

Remember: `systemctl` is used to manage Linux services such as start, stop, restart and check status.




---------------

yum install nginx -y



---------------

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowCloudWatchLogs",
      "Effect": "Allow",
      "Principal": {
        "Service": "logs.amazonaws.com"
      },
      "Action": [
        "s3:PutObject",
        "s3:GetBucketAcl",
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::my-cloudwatch-logs-bucket-pr/*",
        "arn:aws:s3:::my-cloudwatch-logs-bucket-pr"
      ]
    }
  ]
}



---------------

import boto3
import gzip
import json
import time

# AWS clients
logs_client = boto3.client('logs')
s3_client = boto3.client('s3')

# Constants
S3_BUCKET_NAME ='s3-log-bkt-11882'
LOG_GROUP =  'ec2-all-logs'
TIME_WINDOW_HOURS = 24 # Change to 12, 48, etc. if needed

def lambda_handler(event, context):
    start_time = int((time.time() - TIME_WINDOW_HOURS * 3600) * 1000)
    end_time = int(time.time() * 1000)

    # Paginate through all streams in the log group
    paginator = logs_client.get_paginator('describe_log_streams')
    page_iterator = paginator.paginate(logGroupName=LOG_GROUP)

    uploaded_files = []

    for page in page_iterator:
        for stream in page['logStreams']:
            log_stream_name = stream['logStreamName']

            try:
                # Fetch log events
                response = logs_client.get_log_events(
                    logGroupName=LOG_GROUP,
                    logStreamName=log_stream_name,
                    startTime=start_time,
                    endTime=end_time,
                    limit=10000
                )

                log_events = response.get('events', [])
                if not log_events:
                    continue # Skip empty streams
                
                # Format events and compress data
                log_data = '\n'.join([json.dumps(event) for event in log_events]).encode('utf-8')
                compressed_log_data = gzip.compress(log_data)

                # Sanitize stream name for S3 key
                file_name = f"{log_stream_name.replace('/', '-')}.gz"

                s3_client.put_object(
                    Bucket=S3_BUCKET_NAME,
                    Key=file_name,
                    Body=compressed_log_data,
                    ContentType='application/gzip'
                )

                uploaded_files.append(file_name)

            except Exception as e:
                print(f"Error processing stream {log_stream_name}: {e}")

    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': f'Successfully uploaded {len(uploaded_files)} log files to S3.',
            'files': uploaded_files
        })
    }
