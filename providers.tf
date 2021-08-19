/*
CREATED BY A TEMPLATE
DO NOT EDIT MANUALLY
*/

provider "aws" {
    alias = "af-south-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "af-south-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "ap-east-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "ap-east-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "ap-northeast-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "ap-northeast-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "ap-northeast-2"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "ap-northeast-2"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "ap-northeast-3"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "ap-northeast-3"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "ap-south-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "ap-south-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "ap-southeast-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "ap-southeast-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "ap-southeast-2"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "ap-southeast-2"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "ca-central-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "ca-central-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "eu-central-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "eu-central-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "eu-north-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "eu-north-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "eu-south-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "eu-south-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "eu-west-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "eu-west-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "eu-west-2"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "eu-west-2"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "eu-west-3"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "eu-west-3"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "me-south-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "me-south-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "sa-east-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "sa-east-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "us-east-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "us-east-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "us-east-2"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "us-east-2"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "us-west-1"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "us-west-1"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

provider "aws" {
    alias = "us-west-2"
    access_key = var.provider_config.access_key
    secret_key = var.provider_config.secret_key
    region = "us-west-2"
    profile = var.provider_config.profile
    shared_credentials_file = var.provider_config.shared_credentials_file
    token = var.provider_config.token
    max_retries = var.provider_config.max_retries
    allowed_account_ids = var.provider_config.allowed_account_ids
    forbidden_account_ids = var.provider_config.forbidden_account_ids
    insecure = var.provider_config.insecure
    skip_credentials_validation = var.provider_config.skip_credentials_validation
    skip_get_ec2_platforms = var.provider_config.skip_get_ec2_platforms
    skip_region_validation = var.provider_config.skip_region_validation
    skip_requesting_account_id = var.provider_config.skip_requesting_account_id
    skip_metadata_api_check = var.provider_config.skip_metadata_api_check
    s3_force_path_style = var.provider_config.s3_force_path_style

    dynamic "endpoints" {
        for_each = var.provider_config.endpoints == null ? [] : [var.provider_config.endpoints]
        content {
            accessanalyzer = endpoints.value.accessanalyzer
            acm = endpoints.value.acm
            acmpca = endpoints.value.acmpca
            amplify = endpoints.value.amplify
            apigateway = endpoints.value.apigateway
            appconfig = endpoints.value.appconfig
            applicationautoscaling = endpoints.value.applicationautoscaling
            applicationinsights = endpoints.value.applicationinsights
            appmesh = endpoints.value.appmesh
            apprunner = endpoints.value.apprunner
            appstream = endpoints.value.appstream
            appsync = endpoints.value.appsync
            athena = endpoints.value.athena
            auditmanager = endpoints.value.auditmanager
            autoscaling = endpoints.value.autoscaling
            autoscalingplans = endpoints.value.autoscalingplans
            backup = endpoints.value.backup
            batch = endpoints.value.batch
            budgets = endpoints.value.budgets
            chime = endpoints.value.chime
            cloud9 = endpoints.value.cloud9
            cloudformation = endpoints.value.cloudformation
            cloudfront = endpoints.value.cloudfront
            cloudhsm = endpoints.value.cloudhsm
            cloudsearch = endpoints.value.cloudsearch
            cloudtrail = endpoints.value.cloudtrail
            cloudwatch = endpoints.value.cloudwatch
            cloudwatchevents = endpoints.value.cloudwatchevents
            cloudwatchlogs = endpoints.value.cloudwatchlogs
            codeartifact = endpoints.value.codeartifact
            codebuild = endpoints.value.codebuild
            codecommit = endpoints.value.codecommit
            codedeploy = endpoints.value.codedeploy
            codepipeline = endpoints.value.codepipeline
            codestarconnections = endpoints.value.codestarconnections
            //codestarnotifications = endpoints.value.codestarnotifications
            cognitoidentity = endpoints.value.cognitoidentity
            cognitoidp = endpoints.value.cognitoidp
            configservice = endpoints.value.configservice
            connect = endpoints.value.connect
            cur = endpoints.value.cur
            dataexchange = endpoints.value.dataexchange
            datapipeline = endpoints.value.datapipeline
            datasync = endpoints.value.datasync
            dax = endpoints.value.dax
            detective = endpoints.value.detective
            devicefarm = endpoints.value.devicefarm
            directconnect = endpoints.value.directconnect
            dlm = endpoints.value.dlm
            dms = endpoints.value.dms
            docdb = endpoints.value.docdb
            ds = endpoints.value.ds
            dynamodb = endpoints.value.dynamodb
            ec2 = endpoints.value.ec2
            ecr = endpoints.value.ecr
            ecrpublic = endpoints.value.ecrpublic
            ecs = endpoints.value.ecs
            efs = endpoints.value.efs
            eks = endpoints.value.eks
            elasticache = endpoints.value.elasticache
            elasticbeanstalk = endpoints.value.elasticbeanstalk
            elastictranscoder = endpoints.value.elastictranscoder
            elb = endpoints.value.elb
            emr = endpoints.value.emr
            emrcontainers = endpoints.value.emrcontainers
            es = endpoints.value.es
            firehose = endpoints.value.firehose
            fms = endpoints.value.fms
            forecast = endpoints.value.forecast
            fsx = endpoints.value.fsx
            gamelift = endpoints.value.gamelift
            glacier = endpoints.value.glacier
            globalaccelerator = endpoints.value.globalaccelerator
            glue = endpoints.value.glue
            guardduty = endpoints.value.guardduty
            greengrass = endpoints.value.greengrass
            iam = endpoints.value.iam
            identitystore = endpoints.value.identitystore
            imagebuilder = endpoints.value.imagebuilder
            inspector = endpoints.value.inspector
            iot = endpoints.value.iot
            iotanalytics = endpoints.value.iotanalytics
            iotevents = endpoints.value.iotevents
            kafka = endpoints.value.kafka
            kinesis = endpoints.value.kinesis
            kinesisanalytics = endpoints.value.kinesisanalytics
            kinesisanalyticsv2 = endpoints.value.kinesisanalyticsv2
            kinesisvideo = endpoints.value.kinesisvideo
            kms = endpoints.value.kms
            lakeformation = endpoints.value.lakeformation
            lambda = endpoints.value.lambda
            lexmodels = endpoints.value.lexmodels
            licensemanager = endpoints.value.licensemanager
            lightsail = endpoints.value.lightsail
            location = endpoints.value.location
            macie = endpoints.value.macie
            macie2 = endpoints.value.macie2
            managedblockchain = endpoints.value.managedblockchain
            marketplacecatalog = endpoints.value.marketplacecatalog
            mediaconnect = endpoints.value.mediaconnect
            mediaconvert = endpoints.value.mediaconvert
            medialive = endpoints.value.medialive
            mediapackage = endpoints.value.mediapackage
            mediastore = endpoints.value.mediastore
            mediastoredata = endpoints.value.mediastoredata
            mq = endpoints.value.mq
            mwaa = endpoints.value.mwaa
            neptune = endpoints.value.neptune
            networkfirewall = endpoints.value.networkfirewall
            networkmanager = endpoints.value.networkmanager
            opsworks = endpoints.value.opsworks
            organizations = endpoints.value.organizations
            outposts = endpoints.value.outposts
            personalize = endpoints.value.personalize
            pinpoint = endpoints.value.pinpoint
            pricing = endpoints.value.pricing
            //prometheusservice = endpoints.value.prometheusservice
            qldb = endpoints.value.qldb
            quicksight = endpoints.value.quicksight
            ram = endpoints.value.ram
            rds = endpoints.value.rds
            redshift = endpoints.value.redshift
            resourcegroups = endpoints.value.resourcegroups
            resourcegroupstaggingapi = endpoints.value.resourcegroupstaggingapi
            route53 = endpoints.value.route53
            route53domains = endpoints.value.domains
            route53resolver = endpoints.value.resolver
            s3 = endpoints.value.s3
            s3control = endpoints.value.control
            s3outposts = endpoints.value.outposts
            sagemaker = endpoints.value.sagemaker
            schemas = endpoints.value.schemas
            sdb = endpoints.value.sdb
            secretsmanager = endpoints.value.secretsmanager
            securityhub = endpoints.value.securityhub
            serverlessrepo = endpoints.value.serverlessrepo
            servicecatalog = endpoints.value.servicecatalog
            servicediscovery = endpoints.value.servicediscovery
            servicequotas = endpoints.value.servicequotas
            ses = endpoints.value.ses
            shield = endpoints.value.shield
            signer = endpoints.value.signer
            sns = endpoints.value.sns
            sqs = endpoints.value.sqs
            ssm = endpoints.value.ssm
            ssoadmin = endpoints.value.ssoadmin
            stepfunctions = endpoints.value.stepfunctions
            storagegateway = endpoints.value.storagegateway
            sts = endpoints.value.sts
            swf = endpoints.value.swf
            synthetics = endpoints.value.synthetics
            timestreamwrite = endpoints.value.timestreamwrite
            transfer = endpoints.value.transfer
            waf = endpoints.value.waf
            wafregional = endpoints.value.wafregional
            wafv2 = endpoints.value.wafv2
            worklink = endpoints.value.worklink
            workmail = endpoints.value.workmail
            workspaces = endpoints.value.workspaces
            xray = endpoints.value.xray
        }
    }

    dynamic "assume_role" {
        for_each = var.provider_config.assume_role == null ? [] : [var.provider_config.assume_role]
        content {
            duration_seconds = assume_role.duration_seconds
            external_id = assume_role.external_id
            policy = assume_role.policy
            policy_arns = assume_role.policy_arns
            role_arn = assume_role.role_arn
            session_name = assume_role.session_name
            tags = assume_role.tags
            transitive_tag_keys = assume_role.transitive_tag_keys
        }
    }

    dynamic "default_tags" {
        for_each = var.provider_config.default_tags == null ? [] : [var.provider_config.default_tags]
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = var.provider_config.ignore_tags == null ? [] : [var.provider_config.ignore_tags]
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}

