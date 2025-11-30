function capitalizeWords(str) {
    return str.split(" ").map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(" ");
}
// i want to use the function capitalizeWords to the object keys and convert them to uppercase


const user = { first_name: "John", last_name: "Doe" };
const uppercasedUser = Object.fromEntries(
    Object.entries(user).map(([key, value]) => [key.toUpperCase(), value])
);
console.log(uppercasedUser);