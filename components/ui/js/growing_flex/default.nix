{ stdenv, buildFractalideComponent, filterContracts, genName, upkeepers
  , ui_js_flex
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  filteredContracts = filterContracts ["js_create" "generic_text" "fbp_action"];
  depsSha256 = "0wpz03wza7yqa7gbj86gs0wg63n312bnlfzn7br3f9qlbs2c66dv";
  configurePhase = ''
      substituteInPlace src/lib.rs --replace "ui_js_flex" "${ui_js_flex}"
  '';
  meta = with stdenv.lib; {
    description = "Component: draw a growable flex ";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/print;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
