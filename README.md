# ide
spin up a web IDE really quick with `docker-compose`

This is a docker image of cloud9's browser ide.
It binds `./workspace` on the host to `/workspace` inside the container.

### Basic usage

```bash
git clone https://github.com/andreicon/ide
cd ide
docker-compose up -d
```

### Add more services

To test your application you can run nodejs or another container alongside the ide.

To run a node app with a datastore add the following services to the compose file:

```yaml
node:
  image: node
  volumes_from: data
  workdir: /workspace
  command: npm start
  ports:
    - "3000:3000"
  links:
    - "db:redis"
db:
  image: redis
```

Configure the example above to fit your needs and bring it up using

```bash
docker-compose start redis
docker-compose start node
```
