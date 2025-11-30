// Write a function that capitalizes the first letter of each word.
// Expected output: "Hello World From Javascript"
function capitalizeWords(str) {
    return str.split(" ").map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(" ");
}
console.log(capitalizeWords("hello world from javascript"));