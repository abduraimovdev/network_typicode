enum TypiCodeApi {
  users("/users"),
  comments("/comments"),
  post("/posts"),
  albums("/albums"),
  photos("/photos"),
  todos("/todos"),
  products("/products");

  const TypiCodeApi(this.path);

  final String path;

  static const typicodeUrl = "jsonplaceholder.typicode.com";
}