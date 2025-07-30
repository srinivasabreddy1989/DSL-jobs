job('docker-image-build') {
    description('Builds Docker image from source code')
    
    scm {
        git('https://github.com/srinivasabreddy1989/DSL-jobs.git', 'master')
    }

    triggers {
        scm('H/5 * * * *')  // Optional: Poll SCM or use webhook
    }

    steps {
        shell('''
            echo "Building Docker image..."
            docker build -t mycompany/web-service:latest .

            echo "Saving Docker image locally..."
            docker images

            # Optional: Push to Docker Hub (if creds and login configured)
            # echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
            # docker push mycompany/web-service:latest
        ''')
    }

    wrappers {
        colorizeOutput()
    }
}
