import {userDetail} from "constants/user";

export default function handler(req, res) {

    res.status(200).json(userDetail)
}