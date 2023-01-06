{
      description = "Work system";

        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";
                    darwin.url = "github:lnl7/nix-darwin/master";
                        darwin.inputs.nixpkgs.follows = "nixpkgs";
        };

          outputs = { self, darwin, nixpkgs }: {
                  darwinConfigurations."work" = darwin.lib.darwinSystem {
                            system = "x86_64-darwin";
                                  modules = [ ./configuration.nix ];
                                  inputs = { inherit darwin nixpkgs; };
                  };
          };
}
