// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import SearchCountriesController from "./search_countries_controller"
application.register('search-countries', SearchCountriesController)

import AutoSubmit from '@stimulus-components/auto-submit'
application.register('auto-submit', AutoSubmit)

import Notification from '@stimulus-components/notification'
application.register('notification', Notification)


// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
