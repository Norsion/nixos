{
  self,
  ...
}:

{
  module = {
    description = "NixOS module template";
    path = "${self}/templates/module";
  };
}