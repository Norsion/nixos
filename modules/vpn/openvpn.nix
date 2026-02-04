{
  config,
  pkgs,
  ... 
}:
{
  services.openvpn.servers = {
    officeVPN  = { 
      config = '' config path''; };
  };
}