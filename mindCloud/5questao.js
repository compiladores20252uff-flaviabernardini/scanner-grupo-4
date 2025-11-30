// Convert snake_case or kebab-case strings to camelCase.
function toCamelCase(str) {
    return str.replace(/[-_](.)/g, (_, char) => char.toUpperCase());
}
console.log(toCamelCase("user_name"));       // -> "userName"
console.log(toCamelCase("user-address"));    // -> "userAddress"
console.log(toCamelCase("user_name_test"));  // -> "userNameTest"