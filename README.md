# cvcp - container volume cp

A python script to simplify transferring data across container volumes.

---

## Using cvcp

Download the file `cvcp` from the repository and place it inside your preferred path. I prefer `~/bin`.

Then, to use `cvcp`:

```bash
cvcp SOURCE DESTINATION
```

Path inside a container volume should be written as `<volume_name>:<path_inside_volume>`.

Either `SOURCE` or `DESTINATION` can be a local path or a path inside a container volume. Note however that both `SOURCE` and `DESTINATION` cannot be local paths.

The following command line options are available to customise the behaviour:

- `--docker` and `--podman`
  - The container engine to use.
  - The default is `docker`.

- `--rootless`
  - Use the container engine without root.

- `--image`
  - The container image to be used.
  - Note that the image needs to have `rsync` installed.

- `--rsync-opts`
  - Options to pass to `rsync`.
  - Note that, it would be best to pass all the options as a quoted string **with a space at the beginning**. For example, `' --verbose'`.
  - Using this option would clear the default `rsync` options, so make sure to pass all the options required.
  - The default options are `' -a --progress'`.

- `--no-exec`
  - Print the command and exit.

---

## Using a custom image

To use a custom image with `cvcp`, use the `--image` argument.

To permanently change the default image that `cvcp` uses, change this line in the `cvcp` script file:

```python
RSYNC_IMAGE = "image_name"
```

Whatever image you use, it needs to have `rsync` installed. You can use the Dockerfile inside the same repository as a base to build the image.

```bash
# docker
sudo docker build -t localhost/rsync .

# podman
podman build -t localhost/rsync .
```
