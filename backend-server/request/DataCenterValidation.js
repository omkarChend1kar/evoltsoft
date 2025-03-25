import { check } from 'express-validator';
import { returnValidationErrors } from './ReturnValidationErrors.js';

export const validateDataCenterName = [
  check('lat').notEmpty().withMessage('Please Provide User Latitude.'),
  check('long').notEmpty().withMessage('Please Provide User Longitude.'),
  check('radius').notEmpty().withMessage('Please Provide Radius to cover'),
  returnValidationErrors
];


