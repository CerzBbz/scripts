const one = require("./obj1.json");
const two = require("./obj2.json");

const compareObjects = (obj1, obj2) => {
  const differences = [];

  const compareProps = (prop1, prop2, currentPath) => {
    if (typeof prop1 !== typeof prop2) {
      differences.push({
        path: currentPath,
        value1: prop1,
        value2: prop2,
      });
    } else if (typeof prop1 === "object") {
      if (Array.isArray(prop1) && Array.isArray(prop2)) {
        const str1 = JSON.stringify(prop1);
        const str2 = JSON.stringify(prop2);

        if (str1 !== str2) {
          differences.push({
            path: currentPath,
            value1: prop1,
            value2: prop2,
          });
        }
      } else {
        const keys1 = Object.keys(prop1);
        const keys2 = Object.keys(prop2);

        const allKeys = new Set([...keys1, ...keys2]);

        for (const key of allKeys) {
          const newPath = currentPath ? `${currentPath}.${key}` : key;
          compareProps(prop1[key], prop2[key], newPath);
        }
      }
    } else if (prop1 !== prop2) {
      differences.push({
        path: currentPath,
        value1: prop1,
        value2: prop2,
      });
    }
  };

  compareProps(obj1, obj2, "");

  return differences;
};

console.log(compareObjects(two, one));
