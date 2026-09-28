import express from 'express';
import { addUser, allUsers } from '../controllers/user.controller.js';

const router = express.Router();

router.get('/', allUsers);
router.post('/', addUser);

export default router;
