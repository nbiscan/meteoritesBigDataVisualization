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
  { label: "Is empty?", value: "st_is_empty" },
  { label: "Is collection?", value: "st_is_collection" },
  { label: "Is closed?", value: "st_is_closed" },
  { label: "Geometry type", value: "geometry_type" },
  { label: "Number of geometries", value: "st_num_geometries" },
  { label: "Number of interior rings", value: "st_num_interior_rings" },
  { label: "As binary", value: "st_as_binary" },
  { label: "As geojson", value: "st_as_geojson" },
  { label: "As text", value: "st_as_text" }
];

export const binaryOperations = [
  { label: "Union", value: "st_union" },
  { label: "Intersection", value: "st_intersection" },
  { label: "Disjoint?", value: "st_disjoint" },
  { label: "Difference", value: "st_difference" },
  { label: "Symmetric difference", value: "st_sym_difference" },
  { label: "Crosses?", value: "st_crosses" },
  { label: "Contains?", value: "st_contains" }
];
