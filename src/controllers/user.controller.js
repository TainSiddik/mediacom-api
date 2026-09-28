import { createNewUser, getAllUsers } from '../services/user.service.js';

export const allUsers = async (req, res) => {
  try {
    const users = await getAllUsers();
    res.status(200).json({
      status: 'success',
      message: 'Get all data users successfully !',
      data: users,
    });
  } catch (error) {
    res.status(500).json({
      status: 'failed !',
      message: error.message,
    });
  }
};

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
