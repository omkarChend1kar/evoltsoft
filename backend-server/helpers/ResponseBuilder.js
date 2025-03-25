// responseBuilder.js

// Define a function to build success responses
export const successResponse = (data, message = "Success", success = true) => {
  return {
    success,
    message,
    data,
  }
}

export const errorResponse = (message, success = false) => {
  return {
    message,
    success,
  };
}


