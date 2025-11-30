// Apply toCamelCase to all object keys.
const apiData = {
  "user_name": "Alice",
  "user_age": 30,
  "user-country": "UK"
};

// Expected output:
// { userName: "Alice", userAge: 30, userCountry: "UK" }
function toCamelCase(str) {
    return str.replace(/[-_](.)/g, (_, char) => char.toUpperCase());
}

const camelCasedData = Object.fromEntries(
    Object.entries(apiData).map(([key, value]) => [toCamelCase(key), value])
);

console.log(camelCasedData);