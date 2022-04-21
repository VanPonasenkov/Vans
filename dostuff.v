import os

struct Target {
	comp bool
	target_name string
}

const (
	st = Target{false, 'st'}
	dwm = Target{true, 'dwm'}
	dmenu = Target{true, 'dmenu'} 
	targets = [st]
)
	
fn vans_init(rootpriv string, target string) {
	ret := os.execute('$rootpriv sh -c \'cd $target && make clean install\'')
	println(ret.output)
	if ret.exit_code != 0 {
		println('Couldnt build $target, exiting!')
		exit(1)
	}
}
fn main() {
	for target in targets {
		if target.comp {
			vans_init('doas', '$os.getwd()/$target.target_name')
		}
	}
	os.cp_all("./config", "$os.getenv('HOME')/.config/", false)?
}    
