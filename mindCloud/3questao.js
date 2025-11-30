// Convert all keys in an object to uppercase.
const user = { first_name: "John", last_name: "Doe" };
// Expected output: { FIRST_NAME: "John", LAST_NAME: "Doe" }
const uppercasedUser = Object.fromEntries(
    Object.entries(user).map(([key, value]) => [key.toUpperCase(), value])
);
console.log(uppercasedUser);