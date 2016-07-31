# deepsea-docker 

This contains a Docker image for **training** a new DeepSEA model ([v0.93](http://deepsea.princeton.edu/media/code/deepsea.v0.93.tar.gz)). If you are looking for a docker that **predicts** with the published DeepSEA model on 919 epigenomics features without re-training, check out [our another repo](https://github.com/gifford-lab/deepsea-predict-docker).

### Building the image

We have set up an automated build
[here](https://hub.docker.com/r/giffordlab/deepsea-docker/).  Pushes
should automatically trigger builds on the Docker hub.  If you want to
build a local image, you can run:

    docker build -t giffordlab/deepsea-docker .

### Getting the image

You can get the (public) automated build image from any machine,
including EC2 ones, by running:

    docker pull giffordlab/deepsea-docker

Prerequisites are Docker and having the NVIDIA 346.46 driver installed
(the default for CUDA 7.0; see the upstream image documentation).

### Using the image

Run the image with:

    docker run -it --rm \
    --device /dev/nvidia0 \
    --device /dev/nvidia1 \
    --device /dev/nvidia2 \
    --device /dev/nvidia-uvm \
    --device /dev/nvidiactl \
    giffordlab/deepsea-docker

This will launch the training script (`main.lua`) with a subsampled input file
that's part of the image (`train.mat`).  Their full training input
file is around 4 GB and therefore is not on Github.

Check the `main.lua` source for command-line options.  Right now, the
only way to change the input is to use `docker run -v` to replace
`/root/deepsea/input` with a physical directory containing files
`train.mat` and `valid.mat` (formats TBD).

To capture the output, run commands interactively or mount
`/root/deepsea/results` to a physical directory (you can use the
`-save` option in `main.lua` for more flexibility).

### License

The original code is from the Troyanskaya lab, see
[here](http://deepsea.princeton.edu/).
