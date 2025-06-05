{ pkgs }:
{
  networking.wg-quick.interfaces = {
     mir = {
      address = [];
      dns = [];
      privateKeyFile = "/private/wireguard_key";

      peers = [
        {
          publicKey = "";
        } 
      ];
    }; 
  };
}