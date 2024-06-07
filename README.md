lib  
├── core  
│ ├── data  
│ │ ├── datasources  
│ │ │ ├── local  
│ │ │ │ └── shared_preferences_datasource.dart //dark mode
│ │ │ └── remote  
│ │ │ ├── firebase_datasource.dart  
│ │ │ └── api_service.dart  
│ │ ├── models  
│ │ │ ├── api_response.dart  
│ │ │ └── other_core_models.dart  
│ │ └── repositories  
│ │ ├── auth_repository.dart  
│ │ ├── category_repository.dart  
│ │ └── product_repository.dart  
│ ├── domain  
│ │ ├── entities  
│ │ │ ├── category.dart  
│ │ │ ├── product.dart  
│ │ │ └── user.dart  
│ │ └── usecases  
│ │ ├── get_categories.dart  
│ │ ├── get_products.dart  
│ │ └── other_usecases.dart  
│ ├── presentation  
│ │ ├── localization  
│ │ │ ├── app_localizations.dart  
│ │ │ └── l10n.dart  
│ │ ├── providers  
│ │ │ ├── auth_provider.dart  
│ │ │ ├── theme_provider.dart  
│ │ │ └── other_providers.dart  
│ │ ├── routes  
│ │ │ └── app_routes.dart  
│ │ ├── utils  
│ │ │ ├── app_constants.dart  
│ │ │ ├── app_themes.dart  
│ │ │ └── sized_box_extensions.dart  
│ │ └── widgets  
│ │ ├── custom_app_bar.dart  
│ │ ├── product_card.dart  
│ │ └── other_widgets.dart  
├── features  
│ ├── cart  
│ ├── categories  
│ ├── favorite  
│ ├── home  
│ ├── product_details  
│ ├── profile  
│ └── splash  
├── firebase_options.dart  
└── main.dart
