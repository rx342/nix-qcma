{
  testers,
  path,
  qcma,
  nix-vitamtp,
}:

testers.runNixOSTest {
  name = "qcma";
  nodes = {
    machine =
      { ... }:
      {
        environment.systemPackages = [ qcma ];

        imports = [
          "${nix-vitamtp}/modules/nixos.nix"
          "${path}/nixos/tests/common/x11.nix"
        ];
      };
  };
  testScript =
    { nodes, ... }: # python
    ''
      start_all()

      machine.wait_for_unit("graphical.target")
      machine.wait_for_file("${nodes.machine.users.users.root.home}/.Xauthority", timeout=120)

      machine.wait_for_file("/etc/udev/rules.d/60-psvita.rules", timeout=120)

      machine.execute("qcma >/dev/null 2>&1 &")
      machine.wait_for_window("QCMA Settings", timeout=60)

      machine.shutdown()
    '';
}
