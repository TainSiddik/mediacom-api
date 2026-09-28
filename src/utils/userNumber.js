import { prisma } from '../lib/prisma.js';

export const createUserNumber = async (role) => {
  const year = new Date().getFullYear();
  const yearCode = String(year).slice(-2);

  let total;

  if (role === 'Admin') {
    total = await prisma.admin.count();
  } else if (role === 'Instructor') {
    total = await prisma.instructor.count();
  } else {
    total = await prisma.student.count();
  }

  const prefix = {
    Admin: 'ADM',
    Instructor: 'INS',
    Student: 'STD',
  };

  return `${prefix[role]}${yearCode}${total + 1}`;
};
