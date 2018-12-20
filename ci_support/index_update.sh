# Install miniconda
sudo apt-get update

ARCH=`uname -m`
echo "ARCH: $ARCH"

if [[ "$TRAVIS_PYTHON_VERSION" == "2.7" ]]; then
    wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-$ARCH.sh -O miniconda.sh;
else
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-$ARCH.sh -O miniconda.sh;
fi

chmod +x miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
echo 'PATH =' $PATH
conda config --set always_yes yes
conda info -a


# Install conda build
conda install conda-build

# Install lftp
sudo apt-get install lftp

# Get the files
wget -r -np -nH --cut-dirs=3 -R "index.html*" -P $HOME/miniconda/repo https://oplab9.parqtec.unicamp.br/pub/ppc64el/power-ai/

# Generate conda index
cd $HOME/miniconda/repo
conda index . -n powerai --verbose
