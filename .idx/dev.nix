# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.php82
    pkgs.php82Packages.composer
    pkgs.nodejs_20
    pkgs.postgresql_16
  ];
  # Sets environment variables in the workspace
  env = { };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        # Example: install JS dependencies from NPM
        npm-install = "npm install";
        composer-create-project = "composer create-project";
        # init-postgres-db = "initdb -D .idx/.postgres -U postgres";
        # init-postgres-lockfolder = "mkdir /run/postgresql";
        # run-postgres-db = "/usr/bin/pg_ctl -D .idx/.postgres -l .idx/.postgres/logfile start";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [ "README.md" ];
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
      onStart = {
        #
      };
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        web = {
          command = [ "php" "artisan" "serve" "--port" "$PORT" "--host" "0.0.0.0" ];
          manager = "web";
        };
      };
    };
  };
}
