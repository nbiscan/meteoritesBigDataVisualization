export function getRandomColor() {
  var letters = "0123456789ABCDEF";
  var color = "#";
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color.toString();
}

export const ROOT_URL = "localhost";

export const unaryOperations = [
  { label: "Area", value: "st_area" },
  { label: "Dimension", value: "st_dimension" },
  { label: "Is simple?", value: "st_is_simple" },
  { label: "Is empty?", value: "st_is_empty" }
];

export const operationsOnOneDataset = [
  { label: "Union", value: "st_union" },
  { label: "Intersection", value: "st_intersection" },
  { label: "Disjoint", value: "st_disjoint" },
  { label: "Difference", value: "st_difference" },
  { label: "Symmetric difference", value: "st_sym_difference" }
];

export const operationsBetweenDatasets = [
  { label: "Union", value: "st_union" },
  { label: "Intersection", value: "st_intersection" },
  { label: "Disjoint", value: "st_disjoint" },
  { label: "Difference", value: "st_difference" },
  { label: "Symmetric difference", value: "st_sym_difference" }
];

export const allDatasets = [
  { label: "Miami", value: "miami.Miami" },
  { label: "Geneve", value: "geneve.Geneve" }
];
