import bcrypt from 'bcrypt';
import { prisma } from '../lib/prisma.js';
import { createSlug } from '../utils/slug.js';
import { createUserNumber } from '../utils/userNumber.js';

export const createNewUser = async (data) => {
  const hashPassword = await bcrypt.hash(data.password, 10);
  const baseSlug = createSlug(data.name);
  let slug = baseSlug;
  let number = 2;
  while (
    await prisma.user.findUnique({
      where: {
        slug,
      },
    })
  ) {
    slug = `${baseSlug}-${number}`;
    number++;
  }

  const user = await prisma.user.create({
    data: {
      ...data,
      password: hashPassword,
      slug,
    },
  });

  const userNumber = await createUserNumber(user.role);

  if (user.role === 'Admin') {
    await prisma.admin.create({
      data: {
        user_id: user.id,
        admin_number: userNumber,
      },
    });
  } else if (user.role === 'Instructor') {
    await prisma.instructor.create({
      data: {
        user_id: user.id,
        instructor_number: userNumber,
      },
    });
  } else {
    await prisma.student.create({
      data: {
        user_id: user.id,
        student_number: userNumber,
      },
    });
  }

  return user;
};
