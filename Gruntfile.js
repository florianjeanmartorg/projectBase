module.exports = function (grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        cssmin: {
            generated: {
                files: [
                    {
                        dest: 'public/dist/styleDependencies.min.css',
                        src: ['public/dist/styleDependencies.css']
                    },
                    {
                        dest: 'public/dist/styleTown.min.css',
                        src: ['public/dist/styleTown.css']
                    },
                    {
                        dest: 'public/dist/styleMobile.min.css',
                        src: ['public/dist/styleMobile.css']
                    }
                ]
            }
        },
        concat: {
            generated: {
                files: [
                    {
                        dest: 'public/dist/dependencies.js',

                        src: [
                            'public/components/jquery/dist/jquery.min.js',
                            'public/components/angular/angular.min.js',
                            'public/components/angular-route/angular-route.min.js',
                            'public/components/bootstrap/dist/js/bootstrap.min.js',
                            'public/components/messenger/build/js/messenger.min.js',
                            'public/components/moment/min/moment.min.js',
                            //'public/components/angular-bootstrap/ui-bootstrap.min.js',
                            'public/components/angular-bootstrap/ui-bootstrap-tpls.min.js',
                            'public/components/angucomplete/angucomplete.js',
                            'public/components/underscore/underscore-min.js',
                            //TODO remove ?
                            //'public/components/mathjs/dist/math.min.js',
                            'public/components/angular-bootstrap-datetimepicker/src/js/datetimepicker.js',
                            'public/components/angular-i18n/angular-locale_fr-fr.js',
                            'public/components/bootstrap/js/transition.js',
                            'public/components/bootstrap/js/collapse.js',
                            'public/components/ng-file-upload/angular-file-upload-all.min.js',
                            'public/components/ng-file-upload/angular-file-upload-shim.min.js',
                            'public/components/ng-table/ng-table.min.js',
                            'public/components/angular-animate/angular-animate.min.js',
                            'public/components/angularjs-geolocation/dist/angularjs-geolocation.min.js',
                            //TODO useless ?
                            'public/components/angular-timer/dist/angular-timer.min.js',
                            'public/components/humanize-duration/humanize-duration.js',
                            //'public/components/highcharts/highcharts.js',
                            //'public/components/highcharts/highcharts-more.js',
                            'public/components/angular-socialshare/angular-socialshare.js',
                            //TODO ???
                            'public/javascripts/facebook_sdk.js',
                            'public/components/ngmap/build/scripts/ng-map.min.js'
                        ]
                    },
                    {
                        dest: 'public/dist/styleMobile.css',

                        src: [
                            'public/components/mobile-angular-ui/dist/css/mobile-angular-ui-base.min.css',

                            'public/components/angucomplete/angucomplete.css',
                            'public/components/bootstrap/dist/css/bootstrap.min.css',
                            'public/components/bootstrap/dist/css/bootstrap-theme.min.css',
                            'public/components/messenger/build/css/messenger.css',
                            'public/components/angular-bootstrap-datetimepicker/src/css/datetimepicker.css',

                            'public/components/angular-socialshare/angular-socialshare.css',
                            'public/css/glingicon.css',
                            'target/scala-2.10/resource_managed/main/public/stylesheets/mobile.css'
                        ]
                    },
                    {


                        dest: 'public/dist/styleDependencies.css',

                        src: ['public/components/angucomplete/angucomplete.css',
                            'public/components/bootstrap/dist/css/bootstrap.min.css',
                            'public/components/bootstrap/dist/css/bootstrap-theme.min.css',
                            'public/components/messenger/build/css/messenger.css',
                            'public/components/angular-bootstrap-datetimepicker/src/css/datetimepicker.css',
                            'public/components/ng-table/ng-table.min.css',
                            'public/components/angular-socialshare/angular-socialshare.css',
                            'public/css/glingicon.css',
                            'public/components/flexslider/flexslider.css',
                            'target/scala-2.10/resource_managed/main/public/stylesheets/main.css',
                            'target/scala-2.10/resource_managed/main/public/stylesheets/web.css']
                    },
                    {
                        dest: 'public/dist/styleTown.css',

                        src: [
                            'public/components/bootstrap/dist/css/bootstrap.min.css',
                            'public/components/bootstrap/dist/css/bootstrap-theme.min.css',
                            'public/components/messenger/build/css/messenger.css',
                            'target/scala-2.10/resource_managed/main/public/stylesheets/town.css']
                    }
                ]
            }
        },
        uglify: {
            my_target: {
                files: {
                    'public/dist/dependencies.min.js': ['public/dist/dependencies.js'],
                    'public/dist/common.min.js': ['public/dist/common.js'],
                    'public/dist/web.min.js': ['public/dist/web.js'],
                    'public/dist/mobile.min.js': ['public/dist/mobile.js'],
                    'public/dist/town.min.js': ['public/dist/town.js']
                }
            }
        },
        ngAnnotate: {
            options: {
                singleQuotes: true
            },
            myApp: {
                files: {
                    'public/dist/common.js': [
                        <!-- directives -->
                        'public/js/directive/technical/dirEnter/directive.js',
                        'public/js/directive/field/dirFieldDate/directive.js',
                        'public/js/directive/field/dirFieldDateSimple/directive.js',
                        'public/js/directive/field/dirFieldSelect/directive.js',
                        'public/js/directive/field/dirFieldText/directive.js',
                        'public/js/directive/field/dirFieldTextArea/directive.js',
                        'public/js/directive/technical/dirFocusMe/directive.js',
                        'public/js/directive/technical/dirInputNumber/directive.js',
                        'public/js/directive/field/dirFieldCheck/directive.js',
                        'public/js/directive/field/dirFieldDocument/directive.js',
                        'public/js/directive/field/dirFieldImageMutiple/directive.js',
                        'public/js/directive/field/dirFieldImageMultipleResizable/directive.js',
                        'public/js/directive/technical/compile.js',
                        <!-- form -->
                        'public/js/directive/form/login/LoginFormCtrl.js',
                        'public/js/directive/form/address/AddressFormCtrl.js',
                        'public/js/directive/form/customerInterest/CustomerInterestFormCtrl.js',
                        'public/js/directive/form/account/AccountFormCtrl.js',
                        'public/js/directive/form/business/BusinessFormCtrl.js',
                        'public/js/directive/form/businessCategory/BusinessCategoryFormCtrl.js',
                        'public/js/directive/form/download/DownloadFormCtrl.js',
                        'public/js/directive/form/promotion/PromotionFormCtrl.js',
                        'public/js/directive/form/businessNotification/BusinessNotificationFormCtrl.js',
                        'public/js/directive/form/schedule/ScheduleFormCtrl.js',
                        'public/js/directive/form/image/ImageFormCtrl.js',
                        'public/js/directive/form/businessSocialNetwork/BusinessSocialNetworkCtrl.js',
                        'public/js/directive/form/contact/ContactFormCtrl.js',
                        'public/js/directive/form/claimBusiness/ClaimBusinessCtrl.js',
                        <!-- component -->
                        'public/js/directive/component/schedule/ScheduleCtrl.js',
                        'public/js/directive/component/gallery/GalleryCtrl.js',
                        'public/js/directive/component/googleMapWidget/GoogleMapWidgetCtrl.js',
                        'public/js/directive/component/searchResult/SearchResultCtrl.js',
                        'public/js/directive/component/searchBar/SearchBarCtrl.js',
                        'public/js/directive/component/followWidget/FollowWidgetCtrl.js',
                        'public/js/directive/component/followWidgetForPublication/FollowWidgetForPublicationCtrl.js',
                        'public/js/directive/component/facebookSharePublication/FacebookSharePublicationCtrl.js',

                        <!-- filters -->
                        'public/js/filter/TranslateTextFilter.js',
                        'public/js/filter/TextFilter.js',
                        'public/js/filter/ZeropadFilter.js',
                        'public/js/filter/ImageFilter.js',

                        <!-- controllers -->
                        'public/js/MainCtrl.js',
                        'public/js/controller/legal.js',


                        <!-- services -->
                        'public/js/service/SuperAdminService.js',
                        'public/js/service/DirectiveService.js',
                        'public/js/service/GenerateIdService.js',
                        'public/js/service/TranslationService.js',
                        'public/js/service/ModelService.js',
                        'public/js/service/FacebookService.js',
                        'public/js/service/LanguageService.js',
                        'public/js/service/CustomerInterestService.js',
                        'public/js/service/AccountService.js',
                        'public/js/service/BusinessCategoryService.js',
                        'public/js/service/BusinessService.js',
                        'public/js/service/ModalService.js',
                        'public/js/service/PromotionService.js',
                        'public/js/service/GeolocationService.js',
                        'public/js/service/BusinessNotificationService.js',
                        'public/js/service/AddressService.js',
                        'public/js/service/FollowService.js',
                        'public/js/service/SearchService.js',
                        'public/js/service/SearchBarService.js',
                        'public/js/service/PublicationService.js',
                        'public/js/service/ConstantService.js',
                        'public/js/service/ContactService.js',
                        'public/js/service/FileService.js',
                        'public/js/service/ImageService.js',
                        'public/js/service/MapService.js',
                        //TODO ??
                        'public/js/dist/templateCacheWeb.js',
                        'public/js/modal/BasicModal/BasicModal.js',

                        <!-- tool -->
                        'public/js/tool/imageTool/ImageToolCtrl.js',

                        <!-- modal -->
                        'public/js/modal/ConfirmAndShareModal/ConfirmAndShareModal.js'
                    ]
                    , 'public/dist/web.js': [

                        <!-- component -->
                        'public/components/lodash/lodash.min.js',
                        'public/components/flexslider/jquery.flexslider.js',
                        'public/components/angular-flexslider/angular-flexslider.js',

                        <!-- routes -->
                        'public/js/routes/web-routes.js',

                        <!-- init -->
                        'public/js/Init.js',

                        <!-- form -->
                        'public/js/directive/form/businessCreationForm/BusinessCreationFormCtrl.js',

                        <!-- modals -->
                        'public/js/modal/LoginModal/LoginModal.js',
                        'public/js/modal/ChangePassword/ChangePasswordModal.js',
                        'public/js/modal/ForgotPasswordModal/ForgotPasswordModal.js',
                        'public/js/modal/HelpModal/HelpModalCtrl.js',
                        'public/js/modal/DownloadFieldModal/DownloadFieldModal.js',
                        'public/js/modal/CustomerRegistrationModal/CustomerRegistrationModal.js',
                        'public/js/modal/BusinessRegistrationModal/BusinessRegistrationModal.js',
                        'public/js/modal/AddressModal/AddressModal.js',
                        'public/js/modal/EditCustomerInterestModal/EditCustomerInterestModal.js',
                        'public/js/modal/PromotionModal/PromotionModal.js',
                        'public/js/modal/BusinessNotificationModal/BusinessNotificationModal.js',
                        'public/js/modal/OneFieldModal/OneFieldModal.js',
                        'public/js/modal/BasicModal/BasicModal.js',
                        'public/js/modal/MessageModal/MessageModal.js',
                        'public/js/modal/GalleryModal/GalleryModal.js',
                        'public/js/modal/IframeModal/IframeModal.js',
                        'public/js/modal/BusinessCreationModal/BusinessCreationModal.js',

                        <!-- controllers -->
                        'public/js/controller/web/HomeCtrl.js',
                        'public/js/controller/web/ProfileCtrl.js',
                        'public/js/controller/web/BusinessCtrl.js',
                        'public/js/controller/web/SearchPageCtrl.js',
                        'public/js/controller/web/FollowedBusinessPageCtrl.js',
                        'public/js/controller/web/MapCtrl.js',
                        'public/js/controller/web/WelcomeCtrl.js',

                        <!-- component -->
                        'public/js/directive/component/publicationList/PublicationListCtrl.js',
                        'public/js/directive/component/publicationWidget/PublicationWidgetCtrl.js',
                        'public/js/directive/component/publicationListForBusiness/PublicationListForBusinessCtrl.js',
                        'public/js/directive/component/businessList/BusinessListCtrl.js',
                        'public/js/directive/component/categoryLine/CategoryLineCtrl.js',
                        'public/js/directive/component/map/businessForMap/BusinessForMapCtrl.js',
                        'public/js/directive/component/map/publicationForMap/PublicationForMapCtrl.js',
                        'public/js/directive/web/headerBar/HeaderBarCtrl.js',
                        'public/js/directive/web/footerBar/FooterBarCtrl.js',
                        'public/js/directive/component/toTop/ToTopCtrl.js',

                        <!-- service -->
                        'public/js/service/FlashService.js'],
                    'public/dist/mobile.js': [
                        'public/components/lodash/lodash.min.js',
                        'public/components/mobile-angular-ui/dist/js/mobile-angular-ui.min.js',
                        'public/components/mobile-angular-ui/dist/js/mobile-angular-ui.core.min.js',
                        'public/components/mobile-angular-ui/dist/js/mobile-angular-ui.components.min.js',
                        'public/js/routes/mobile-routes.js',
                        'public/js/InitMobile.js',

                        <!-- modal -->
                        'public/js/modal/ChangePassword/ChangePasswordModal.js',
                        'public/js/modal/AddressModal/AddressModal.js',
                        'public/js/modal/OneFieldModal/OneFieldModal.js',
                        'public/js/modal/mobile/AlertModal/AlertMessage.js',
                        'public/js/modal/mobile/LoadingModal/LoadingModal.js',
                        'public/js/modal/mobile/InterestSelectionModal/InterestSelectionModal.js',
                        'public/js/modal/MessageModal/MessageModal.js',
                        'public/js/directive/mobile/galleryMobile/GalleryMobileCtrl.js',
                        'public/js/modal/ResizeImageMobileModal/ResizeImageMobileModal.js',

                        <!-- controller -->
                        'public/js/controller/mobile/WelcomeCtrl.js',
                        'public/js/controller/mobile/HomeCtrl.js',
                        'public/js/controller/mobile/ForgotPasswordCtrl.js',
                        'public/js/controller/mobile/CustomerRegistrationCtrl.js',
                        'public/js/controller/mobile/MenuCtrl.js',
                        'public/js/controller/mobile/ProfileCtrl.js',
                        'public/js/controller/mobile/BusinessCtrl.js',
                        'public/js/controller/mobile/SearchPageCtrl.js',
                        'public/js/controller/mobile/FollowedBusinessPageCtrl.js',
                        'public/js/controller/mobile/PromotionCtrl.js',
                        'public/js/controller/mobile/BusinessNotificationCtrl.js',

                        <!-- component -->
                        'public/js/directive/component/businessListMobile/BusinessListMobileCtrl.js',
                        'public/js/directive/component/publicationListMobile/PublicationListMobileCtrl.js',
                        'public/js/directive/component/publicationListMobileForBusiness/PublicationListMobileForBusinessCtrl.js',
                        'public/js/directive/mobile/headerSearch/HeaderSearchCtrl.js',
                        'public/js/directive/mobile/title/MobileTitleCtrl.js',
                        'public/js/directive/component/categoryLine/CategoryLineCtrl.js',
                        'public/js/directive/component/publicationWidgetForMobile/PublicationWidgetCtrl.js',

                        <!-- service -->
                        'public/js/service/mobile/FlashService.js',

                    ],
                    'public/dist/town.js': [
                        'public/components/jquery/dist/jquery.min.js',
                        'public/components/angular/angular.min.js',
                        'public/components/bootstrap/dist/js/bootstrap.min.js',
                        'public/components/messenger/build/js/messenger.min.js',
                        'public/components/angular-bootstrap/ui-bootstrap-tpls.min.js',
                        'public/components/angular-i18n/angular-locale_fr-fr.js',
                        'public/components/bootstrap/js/transition.js',
                        'public/components/ngmap/build/scripts/ng-map.min.js',
                        'public/js/InitTown.js',
                        'public/js/service/town/TownService.js',
                        'public/js/service/FlashService.js',
                        'public/js/service/DirectiveService.js',
                        'public/js/service/TranslationService.js',
                        'public/js/service/ConstantService.js',
                        'public/js/filter/ImageFilter.js',
                        'public/js/filter/TranslateTextFilter.js',
                        'public/js/modal/GalleryModal/GalleryModal.js',
                        'public/js/TownMainCtrl.js',
                        'public/js/directive/town/townBusiness/TownBusinessCtrl.js',
                        'public/js/directive/town/newsFeedForTown/NewsFeedForTownCtrl.js',
                        'public/js/directive/town/publicationListForTown/PublicationListForTownCtrl.js',
                        'public/js/directive/component/categoryLine/CategoryLineCtrl.js',
                        'public/js/dist/templateCacheWeb-town.js'
                    ]
                }
            }
        }
        ,
        html2js: {
            options: {
                base: 'public',
                module: 'app',
                existingModule: true,
                singleModule: true,
                useStrict: true,
                rename: function (moduleName) {
                    return moduleName.replace('javascripts/', '/assets/javascripts/');
                },
                htmlmin: {
                    collapseBooleanAttributes: true,
                    collapseWhitespace: true,
                    removeAttributeQuotes: true,
                    removeComments: true,
                    removeEmptyAttributes: true,
                    removeRedundantAttributes: true,
                    removeScriptTypeAttributes: true,
                    removeStyleLinkTypeAttributes: true
                }
            },
            main: {
                src: ['public/js/**/*.html'],
                dest: 'public/js/dist/templateCacheWeb.js'
            },
            town: {
                src: ['public/js/directive/town/publicationListForTown/template.html',
                    'public/js/directive/town/townBusiness/template.html',
                    'public/js/directive/town/newsFeedForTown/template.html',
                    'public/js/modal/GalleryModal/view.html'
                ],
                dest: 'public/js/dist/templateCacheWeb-town.js'
            }
        },
        sprite: {
            all: {
                src: 'public/images/interest/*.png',
                dest: 'public/images/dist/interest.png',
                destCss: 'public/dist/sprites.css'
            },
            data: {
                spritesheet: {}
            }
        },
        jasmine: {
            pivotal: {
                src: [
                    'public/dist/dependencies.min.js',
                    'public/components/angular-mocks/angular-mocks.js',
                    'public/dist/web.min.js',
                    'public/dist/common.min.js',
                    'public/js/tests/**/*.js'
                ]
            }
        },
        rename: {
            styleDependencies: {
                src: 'public/dist/styleDependencies.min.css',
                dest: 'public/dist/styleDependencies.final.css'
            },
            styleTown: {
                src: 'public/dist/styleTown.min.css',
                dest: 'public/dist/styleTown.final.css'
            },
            styleMobile: {
                src: 'public/dist/styleMobile.css',
                dest: 'public/dist/styleMobile.final.css'
            },
            common: {
                src: 'public/dist/common.js',
                dest: 'public/dist/common.final.js'
            },
            web: {
                src: 'public/dist/web.js',
                dest: 'public/dist/web.final.js'
            },
            dependencies: {
                src: 'public/dist/dependencies.js',
                dest: 'public/dist/dependencies.final.js'
            },
            mobile: {
                src: 'public/dist/mobile.js',
                dest: 'public/dist/mobile.final.js'
            },
            town: {
                src: 'public/dist/town.js',
                dest: 'public/dist/town.final.js'
            }
        }
    });

// Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-ng-annotate');
    grunt.loadNpmTasks('grunt-html2js');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-usemin');
    grunt.loadNpmTasks('grunt-spritesmith');
    grunt.loadNpmTasks('grunt-contrib-jasmine');
    grunt.loadNpmTasks('grunt-rename');


// Default task(s).
    grunt.registerTask('default', [
        'html2js',
        'concat',
        'ngAnnotate',
        'uglify',
        'cssmin',
        'rename'
    ]);

// cache task(s).
    grunt.registerTask('cache', [
        'html2js'
    ]);

    grunt.registerTask('start-sprite', [
        'sprite'
    ]);

    grunt.registerTask('time', [
        'timestamp'
    ]);

    grunt.registerTask('test', [
        'rename'
    ]);

}
;
