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

fn libs_dl() ?voidptr {
	libs := os.read_lines('libs.txt')?.join(' ')
	ret := os.execute('doas pacman -S $libs')
	println(ret.output)
	if ret.exit_code != 0 {
		println('Couldnt build libraries! exiting!')
		exit(1)
	}
	return error('Couldnt do stuff!')
}

fn main() {
	usrhome := os.getenv('HOME')
	for target in targets {
		if target.comp {
			vans_init('doas', '$os.getwd()/$target.target_name')
		}
	}
	os.cp_all("./config", "${usrhome}/.config/", true)?
	libs_dl()?
}    
