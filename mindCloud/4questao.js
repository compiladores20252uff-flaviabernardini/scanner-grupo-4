// Given an object of strings, return an object with each value reversed.
const data = { name: "alice", city: "london" };
// Expected output: { name: "ecila", city: "nodnol" }
const reversedData = Object.fromEntries(
    Object.entries(data).map(([key, value]) => [key, value.split("").reverse().join("")])
);
console.log(reversedData);