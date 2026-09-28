import { createNewUser } from '../services/user.service.js';

export const addUser = async (req, res) => {
  try {
    const data = req.body;
    const user = await createNewUser(data);
    res.status(201).json({
      status: 'success',
      message: 'Add User successfully !',
      data: user,
    });
  } catch (error) {
    res.status(500).json({
      status: 'failed !',
      message: error.message,
    });
  }
};
