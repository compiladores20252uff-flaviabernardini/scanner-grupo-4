// Convert all nested object keys to camelCase
const nested = {
  user_name: "Alice",
  user_info: {
    user_age: 25,
    user_address: {
      postal_code: "AB12 3CD"
    }
  }
};

// Expected output:
// {
//   userName: "Alice",
//   userInfo: {
//     userAge: 25,
//     userAddress: {
//       postalCode: "AB12 3CD"
//     }
//   }
// }
function toCamelCase(str) {
    return str.replace(/[-_](.)/g, (_, char) => char.toUpperCase());
}

function convertKeysToCamelCase(obj) {
    if (typeof obj !== 'object' || obj === null) {
        return obj;
    }
    if (Array.isArray(obj)) {
        return obj.map(item => convertKeysToCamelCase(item));
    }
    return Object.fromEntries(
        Object.entries(obj).map(([key, value]) => [
            toCamelCase(key),
            convertKeysToCamelCase(value)
        ])
    );
}

const camelCasedNested = convertKeysToCamelCase(nested);
console.log(camelCasedNested);  