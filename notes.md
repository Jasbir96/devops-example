## **What is DevOps?**
DevOps is a set of practices that combines 
* software development (**Dev**)  -> write the code
* IT operations (**Ops**)  -> who deliver
* shorten the development lifecycle while delivering high-quality software.
* It focuses on automation, collaboration, and continuous integration/continuous delivery (CI/CD).


## How real software development is done (High level)
0. Requirement Gathering : 
   1. Edtech : algoprep : 
      1. Landing page , course landing pages 
      2. community, 
      3. course listing,
      4.  course editing, 
      5.  course view 
   2. Product : requirement , Designer : figma file , funtionlaity description
   3. One product : is build using multiple people/teams

1. **Feature request/bug fix** : Requirement is provided features :`Jira ticket` : development tracking  (politics tool)
2. `Development` : 
   1. you write the code , 
   2. you also write test cases , 
   3. push your code to your repository
3. `Build`: Create builds of the application. your code become production ready . You are also 
able to check if there are not run-time .
4. `Test` : unit test cases -> execute
5. `Release` : deploy your code in a particular enviornment 
   1. env: 
      1. local/dev : local machine
      2. `stage` : server that is accessible to developer for checking how things will look upon deployment
      3. `test/QA` : manual tester, 
         1. automation tester : end to end test : to mirror actual user behaviour 
      4. `pre-prod`:  that has all the thing mirroring actual condition end user
6. **Deploy:** Deploy the application on the prod : deploy on the server, prod the url thorugh which the end user can access the code
7.  **Monitor** : Monitor and manage the application.
    1.  error logging : error is encoutered (Sentry)
    2.  performance : perf(auditzy)
    3.  user tracking : GTM 
    4.  user hotmap : where user intercats the the most
    5.   api errors 
**8** . Feature request / Feature update / bug fixes


## Detailed view of each step
2. **Develop**: Accordian
   1. how to make sure a multiple features can be developed parallely ??
      **ans** :  you create feature / bug branch and develop your feature there 
   2. how to make sure the  `husky` : **pre** commit validator  : all the commands you it will execute
      1. code you wrote is running will it also run if released : `npm run build`
       3. readable : format `npm run format`
      3. follow code standards,  `npm run lint`
         1. you are not writing any potenitially buggy code : 
            1. eval, var, unused variables X
         2. some rules : styling
   3. you have completed all the feature requirement : `npm run test` 
      1. Jest , react testing library
3. **Build** :  Create builds of the application. `github action` (continous integration)
   1. code push -> deploy apne code
   2. PR : approve allow to merge  to development 
4. **Test:** Run automated tests. : unit test  that you wrote are  there during the build process
5. **Release:** Developer can push the build to a `staging , test , pre-prod ,  production 
   1. These environments information can easily be mirrored using `docker`
   2. `AWS` , GCP : cloud provie -> server me docker container



## husky
`if command is not found run it in admin mode / linux or macos use sudo`****

```bash
rm -rf .husky
npm install husky --save-dev
npx husky install
npx husky add .husky/pre-commit "npm test"
```

### prettier

```
npm install --save-dev prettier
```

```js
{
  "semi": true,
  "tabWidth": 2,
  "printWidth": 100,
  "singleQuote": true,
  "trailingComma": "es5",
  "bracketSpacing": true
} 
```

## eslint

1. Install ESLint and its dependencies:

```bash
npm install --save-dev eslint  eslint-plugin-import eslint-plugin-react  eslint-plugin-react-hooks
```

2. modify your eslint config
```js
 globals:{ ...globals.browser},
   rules: {
      ...js.configs.recommended.rules,
      ...react.configs.recommended.rules,
      ...react.configs['jsx-runtime'].rules,
      ...reactHooks.configs.recommended.rules,
      'no-console': 'error',
      'no-unused-vars': 'error',
      'react/jsx-no-target-blank': 'off',
      'react-refresh/only-export-components': [
        'warn',
        { allowConstantExport: true },
      ],
    },
  
```


### Adding unit testcases

1. First, let's install the necessary dependencies:

```bash
npm install --save-dev jest @testing-library/react @testing-library/jest-dom @testing-library/user-event jest-environment-jsdom
```

2. create the component write the test cases

3. `jest.config.js` 

```js
export default {
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/jest.setup.js'],
  moduleNameMapper: {
    '\\.(css|less|scss|sass)$': 'identity-obj-proxy',
  },
  transform: {
    '^.+\\.(js|jsx)$': 'babel-jest',
  },
};
```


4. Create a `jest.setup.js` file:

```javascript:jest.setup.js
import '@testing-library/jest-dom';
```

5. Create a `.babelrc` file:

```json:.babelrc
{
  "presets": [
    "@babel/preset-env",
    ["@babel/preset-react", { "runtime": "automatic" }]
  ]
}
```


7. Install additional required dependencies:

```bash
npm install --save-dev @babel/preset-env @babel/preset-react babel-jest identity-obj-proxy
```

8. Update the `package.json` scripts section (reference to existing file at lines 6-13):

```json:package.json
{
  "scripts": {
    "test": "jest",
    "test:watch": "jest --watch"
  }
}
```



## Github Workflows

GitHub Actions allows you to automate tasks like testing, building, and deploying your code. Workflows in GitHub Actions are defined in **YAML files** stored in `.github/workflows` in your repository.

- **Workflow**: A series of steps to be executed 
- **Trigger**: Events like a **pull request** or **push** that start the workflow.


### Assume a local setup
* OS -> networking
* nodejs
* nodemodules : package.json
  Now you can run your set of steps : npm run  format, lint, build test

###  CI: you run a  set check / workflow to make sure that the code is able to integarte 
* which os you want, 
* which nodejs version
* package.json -> npm i , npm i --save-dev
* you run your set of steps 

## Release 
* `Docker`: 
  * what is the usecase of it 
  * Important terms 
  * How to use it 
  * How to create a docker file 
  * Then how to deploy your docker container 
* `AWS`:
  * AWS E2C : elastic compute , 
  * `AWS ECS`
  * `AWS Fargate`

**Vitual machine** : 
* physical hardware-> windows 10 , virtual : macos,linux
* `hypervisor`: emulate a full fleged operating system  
* `Software` : vmware , virtual box 
* usecase :  it used by your cloud provider to provide virtual machine 
* Advantage : It solves the problem  of environment
* cons : it is heavy
 
**What is Docker**
* Docker is a platform for developing, shipping and running applications . 
* It run these application in a thing called container
* Containers are lightweight, standalone packages that include everything needed to run an application:
  - System tools
  - System libraries
  - Settings
  - Runtime  : node , python
  - Code

**Key Docker Concepts**
* `Dockerfile`: Blueprint for building containers (configuration)
* `Image`: Template for running containers 
* `Container`: Running instance of an image
* `Registry`: Storage for Docker images [docker hub]




### Docker Download link
Docker Installation : 
* Ubuntu: https://docs.docker.com/desktop/setup/install/linux/ubuntu/
* Windows : https://docs.docker.com/desktop/setup/install/windows-install/
	* enable wsl2 : https://www.youtube.com/watch?v=eId6K8d0v6o
* ubunutu : https://docs.docker.com/desktop/setup/install/mac-install/



### Docker workflow 

1. **Build Stage**: Creates a lightweight nodejs environment, installs dependencies, and builds the app.
2. **Runtime Stage**: Starts with a fresh Node.js environment, copies built assets, and serves them using `serve`.
3. **Result**: A smaller, production-ready Docker image optimized for deployment.



### Essential Docker Commands
After installing  docker desktop : you need to start it : build the image -> start from here 
```bash
# Build an image
docker build -t image-name .

# List images
docker images

# List running containers 
docker ps

# Run a container
docker run -p 3000:3000 image-name

# Stop a container -> can be done from docker desktop
docker stop container-id

# check for the content inside of that 
docker run -it image-name sh
```

## AWS,GCP,Azure: 
* provide you cheaper, secure and global computing power : servers, databases,
* Aws is available in a lot of geographical locations : multiple locations me place : latency 
* they provide lot of sceurity : virtual private network : which traffic to allow and which to not
* they are cheaper to use then owning a physical device  : lot of options to chooose from , you can scale accrodingly 
*  AWS has a very good free tier


### Few services 
* Billing and cost management : go and set your budget 
* AWS EC2 : a way to rent servers 
* AWS ECS:  container management


. **Update Ubuntu:**
  - Once connected to the instance, update the package lists for upgrades and install new versions of software:
     ```
     sudo apt update
     sudo apt upgrade
    ```


 



