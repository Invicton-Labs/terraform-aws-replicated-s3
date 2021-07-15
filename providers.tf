provider "aws" {
    alias = "bucket_0"
    access_key = length(var.buckets) > 0 ? var.buckets[0].provider_config.access_key : var.buckets[0].provider_config.access_key
    secret_key = length(var.buckets) > 0 ? var.buckets[0].provider_config.secret_key : var.buckets[0].provider_config.secret_key
    region = length(var.buckets) > 0 ? var.buckets[0].provider_config.region : var.buckets[0].provider_config.region
    profile = length(var.buckets) > 0 ? var.buckets[0].provider_config.profile : var.buckets[0].provider_config.profile
    shared_credentials_file = length(var.buckets) > 0 ? var.buckets[0].provider_config.shared_credentials_file : var.buckets[0].provider_config.shared_credentials_file
    token = length(var.buckets) > 0 ? var.buckets[0].provider_config.token : var.buckets[0].provider_config.token
    max_retries = length(var.buckets) > 0 ? var.buckets[0].provider_config.max_retries : var.buckets[0].provider_config.max_retries
    allowed_account_ids = length(var.buckets) > 0 ? var.buckets[0].provider_config.allowed_account_ids : var.buckets[0].provider_config.allowed_account_ids
    forbidden_account_ids = length(var.buckets) > 0 ? var.buckets[0].provider_config.forbidden_account_ids : var.buckets[0].provider_config.forbidden_account_ids
    insecure = length(var.buckets) > 0 ? var.buckets[0].provider_config.insecure : null
    skip_credentials_validation = length(var.buckets) > 0 ? var.buckets[0].provider_config.skip_credentials_validation : true
    skip_get_ec2_platforms = length(var.buckets) > 0 ? var.buckets[0].provider_config.skip_get_ec2_platforms : true
    skip_region_validation = length(var.buckets) > 0 ? var.buckets[0].provider_config.skip_region_validation : true
    skip_requesting_account_id = length(var.buckets) > 0 ? var.buckets[0].provider_config.skip_requesting_account_id : true
    skip_metadata_api_check = length(var.buckets) > 0 ? var.buckets[0].provider_config.skip_metadata_api_check : true
    s3_force_path_style = length(var.buckets) > 0 ? var.buckets[0].provider_config.s3_force_path_style : null

    dynamic "endpoints" {
        for_each = length(var.buckets) > 0 ? (var.buckets[0].provider_config.endpoints == null ? [] : [var.buckets[0].provider_config.endpoints]) : {}
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
            codestarnotifications = endpoints.value.codestarnotifications
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
            prometheusservice = endpoints.value.prometheusservice
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
        for_each = length(var.buckets) > 0 ? (var.buckets[0].provider_config.assume_role == null ? [] : [var.buckets[0].provider_config.assume_role]) : []
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
        for_each = length(var.buckets) > 0 ? (var.buckets[0].provider_config.default_tags == null ? [] : [var.buckets[0].provider_config.default_tags]) : []
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = length(var.buckets) > 0 ? (var.buckets[0].provider_config.ignore_tags == null ? [] : [var.buckets[0].provider_config.ignore_tags]) : []
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}
provider "aws" {
    alias = "bucket_1"
    access_key = length(var.buckets) > 1 ? var.buckets[1].provider_config.access_key : var.buckets[0].provider_config.access_key
    secret_key = length(var.buckets) > 1 ? var.buckets[1].provider_config.secret_key : var.buckets[0].provider_config.secret_key
    region = length(var.buckets) > 1 ? var.buckets[1].provider_config.region : var.buckets[0].provider_config.region
    profile = length(var.buckets) > 1 ? var.buckets[1].provider_config.profile : var.buckets[0].provider_config.profile
    shared_credentials_file = length(var.buckets) > 1 ? var.buckets[1].provider_config.shared_credentials_file : var.buckets[0].provider_config.shared_credentials_file
    token = length(var.buckets) > 1 ? var.buckets[1].provider_config.token : var.buckets[0].provider_config.token
    max_retries = length(var.buckets) > 1 ? var.buckets[1].provider_config.max_retries : var.buckets[0].provider_config.max_retries
    allowed_account_ids = length(var.buckets) > 1 ? var.buckets[1].provider_config.allowed_account_ids : var.buckets[0].provider_config.allowed_account_ids
    forbidden_account_ids = length(var.buckets) > 1 ? var.buckets[1].provider_config.forbidden_account_ids : var.buckets[0].provider_config.forbidden_account_ids
    insecure = length(var.buckets) > 1 ? var.buckets[1].provider_config.insecure : null
    skip_credentials_validation = length(var.buckets) > 1 ? var.buckets[1].provider_config.skip_credentials_validation : true
    skip_get_ec2_platforms = length(var.buckets) > 1 ? var.buckets[1].provider_config.skip_get_ec2_platforms : true
    skip_region_validation = length(var.buckets) > 1 ? var.buckets[1].provider_config.skip_region_validation : true
    skip_requesting_account_id = length(var.buckets) > 1 ? var.buckets[1].provider_config.skip_requesting_account_id : true
    skip_metadata_api_check = length(var.buckets) > 1 ? var.buckets[1].provider_config.skip_metadata_api_check : true
    s3_force_path_style = length(var.buckets) > 1 ? var.buckets[1].provider_config.s3_force_path_style : null

    dynamic "endpoints" {
        for_each = length(var.buckets) > 1 ? (var.buckets[1].provider_config.endpoints == null ? [] : [var.buckets[1].provider_config.endpoints]) : {}
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
            codestarnotifications = endpoints.value.codestarnotifications
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
            prometheusservice = endpoints.value.prometheusservice
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
        for_each = length(var.buckets) > 1 ? (var.buckets[1].provider_config.assume_role == null ? [] : [var.buckets[1].provider_config.assume_role]) : []
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
        for_each = length(var.buckets) > 1 ? (var.buckets[1].provider_config.default_tags == null ? [] : [var.buckets[1].provider_config.default_tags]) : []
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = length(var.buckets) > 1 ? (var.buckets[1].provider_config.ignore_tags == null ? [] : [var.buckets[1].provider_config.ignore_tags]) : []
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}
provider "aws" {
    alias = "bucket_2"
    access_key = length(var.buckets) > 2 ? var.buckets[2].provider_config.access_key : var.buckets[0].provider_config.access_key
    secret_key = length(var.buckets) > 2 ? var.buckets[2].provider_config.secret_key : var.buckets[0].provider_config.secret_key
    region = length(var.buckets) > 2 ? var.buckets[2].provider_config.region : var.buckets[0].provider_config.region
    profile = length(var.buckets) > 2 ? var.buckets[2].provider_config.profile : var.buckets[0].provider_config.profile
    shared_credentials_file = length(var.buckets) > 2 ? var.buckets[2].provider_config.shared_credentials_file : var.buckets[0].provider_config.shared_credentials_file
    token = length(var.buckets) > 2 ? var.buckets[2].provider_config.token : var.buckets[0].provider_config.token
    max_retries = length(var.buckets) > 2 ? var.buckets[2].provider_config.max_retries : var.buckets[0].provider_config.max_retries
    allowed_account_ids = length(var.buckets) > 2 ? var.buckets[2].provider_config.allowed_account_ids : var.buckets[0].provider_config.allowed_account_ids
    forbidden_account_ids = length(var.buckets) > 2 ? var.buckets[2].provider_config.forbidden_account_ids : var.buckets[0].provider_config.forbidden_account_ids
    insecure = length(var.buckets) > 2 ? var.buckets[2].provider_config.insecure : null
    skip_credentials_validation = length(var.buckets) > 2 ? var.buckets[2].provider_config.skip_credentials_validation : true
    skip_get_ec2_platforms = length(var.buckets) > 2 ? var.buckets[2].provider_config.skip_get_ec2_platforms : true
    skip_region_validation = length(var.buckets) > 2 ? var.buckets[2].provider_config.skip_region_validation : true
    skip_requesting_account_id = length(var.buckets) > 2 ? var.buckets[2].provider_config.skip_requesting_account_id : true
    skip_metadata_api_check = length(var.buckets) > 2 ? var.buckets[2].provider_config.skip_metadata_api_check : true
    s3_force_path_style = length(var.buckets) > 2 ? var.buckets[2].provider_config.s3_force_path_style : null

    dynamic "endpoints" {
        for_each = length(var.buckets) > 2 ? (var.buckets[2].provider_config.endpoints == null ? [] : [var.buckets[2].provider_config.endpoints]) : {}
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
            codestarnotifications = endpoints.value.codestarnotifications
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
            prometheusservice = endpoints.value.prometheusservice
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
        for_each = length(var.buckets) > 2 ? (var.buckets[2].provider_config.assume_role == null ? [] : [var.buckets[2].provider_config.assume_role]) : []
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
        for_each = length(var.buckets) > 2 ? (var.buckets[2].provider_config.default_tags == null ? [] : [var.buckets[2].provider_config.default_tags]) : []
        content {
            tags = default_tags.tags
        }
    }

    dynamic "ignore_tags" {
        for_each = length(var.buckets) > 2 ? (var.buckets[2].provider_config.ignore_tags == null ? [] : [var.buckets[2].provider_config.ignore_tags]) : []
        content {
            keys = ignore_tags.keys
            key_prefixes = ignore_tags.key_prefixes
        }
    }
}
