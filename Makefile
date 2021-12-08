.ONESHELL:
SHELL=/bin/bash
ENV_NAME=mmdetection
UNAME := $(shell uname)
CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate

install: update-conda get-pip

update-conda:
	conda env update -f environment.yml

get-pip:
	$(CONDA_ACTIVATE) $(ENV_NAME)
	pip install mmcv-full
	pip install git+https://github.com/open-mmlab/mmdetection.git
	pip install git+https://github.com/open-mmlab/mmsegmentation.git
	pip install -v -e .
