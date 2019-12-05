
all: run

run: instance.start wait instance.ssh

start: instance.start
instance.start:
	gcloud compute instances start fastai --zone us-central1-a

ssh: instance.ssh
instance.ssh:
	gcloud compute ssh --zone=us-central1-a jupyter@fastai -- -L 8080:localhost:8080

stop: instance.stop
instance.stop:
	gcloud compute instances stop fastai --zone us-central1-a

open: jupyter.open fast.ai.open

fast.ai.open:
	open http://fast.ai

jupyter.open:
	open http://localhost:8080/tree/tutorials/fastai/course-v3

wait:
	sleep 1
