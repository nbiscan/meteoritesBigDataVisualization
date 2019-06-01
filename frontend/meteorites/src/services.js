export function getRandomColor() {
  var letters = "0123456789ABCDEF";
  var color = "#";
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color.toString();
}

export const ROOT_URL = "localhost";

export const unaryAttributes = [
  { label: "Area", value: "st_area" },
  { label: "Dimension", value: "st_dimension" },
  { label: "Is simple?", value: "st_is_simple" },
  { label: "Is empty?", value: "st_is_empty" }
];

export const binaryAttributes = [{ label: "Union", value: "st_union" }];
