
import { useState } from "react";

const Typescript = () => {

    const [str, setStr] = useState<string>("Deepak")
    const [num, setNumber] = useState<number>(22)
    const [bo,setBol]=useState<boolean>(false)
    const [fruits, setFruits] = useState<string[]>()

    type obj={
        name:"al"
    }

    const [user, setUser] = useState<obj>({
        name:""
    })


    return <></>
}