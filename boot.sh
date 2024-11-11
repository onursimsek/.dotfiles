set -e

echo '
                               _                     __
  ____  ____  __  ____________(_)___ ___  ________  / /__
 / __ \/ __ \/ / / / ___/ ___/ / __ `__ \/ ___/ _ \/ //_/
/ /_/ / / / / /_/ / /  (__  ) / / / / / (__  )  __/ ,<
\____/_/ /_/\__,_/_/  /____/_/_/ /_/ /_/____/\___/_/|_|

'

target_dir="$HOME/.local/share/.dotfiles"

sudo apt-get update > /dev/null
sudo apt-get install -y git > /dev/null

DOTFILES_REF=${DOTFILES_REF:-main}

echo "Cloning .dotfiles..."
rm -rf ${target_dir}
git clone https://github.com/onursimsek/.dotfiles.git ${target_dir} > /dev/null
if [[ ${DOTFILES_REF} != "main" ]]; then
	cd ${target_dir}
	git fetch origin "${DOTFILES_REF}" && git checkout "${DOTFILES_REF}"
	cd -
fi

echo "Installation starting..."
#source ${target_dir}/install.sh
