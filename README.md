lib  
 ┣ app  
 ┃ ┗ bindings  
 ┃ ┃ ┗ app_binding.dart  
 ┣ core  
 ┃ ┣ data  
 ┃ ┃ ┣ datasources  
 ┃ ┃ ┃ ┣ local  
 ┃ ┃ ┃ ┗ remote  
 ┃ ┃ ┃ ┃ ┗ api_service.dart  
 ┃ ┃ ┣ models  
 ┃ ┃ ┃ ┣ api_response.dart  
 ┃ ┃ ┃ ┗ other_core_models.dart  
 ┃ ┃ ┗ repositories  
 ┃ ┃ ┃ ┣ auth_repository.dart  
 ┃ ┃ ┃ ┣ category_repository.dart  
 ┃ ┃ ┃ ┗ product_repository.dart  
 ┃ ┣ domain  
 ┃ ┃ ┣ entities  
 ┃ ┃ ┃ ┣ category_model.dart  
 ┃ ┃ ┃ ┣ discounts_model.dart  
 ┃ ┃ ┃ ┗ product_model.dart  
 ┃ ┃ ┗ usecases  
 ┃ ┃ ┃ ┣ get_categories.dart  
 ┃ ┃ ┃ ┣ get_products.dart  
 ┃ ┃ ┃ ┗ other_usecases.dart  
 ┃ ┗ presentation  
 ┃ ┃ ┣ localization  
 ┃ ┃ ┃ ┣ ru_ru  
 ┃ ┃ ┃ ┃ ┗ ru.dart  
 ┃ ┃ ┃ ┣ uz_uz  
 ┃ ┃ ┃ ┃ ┗ uz.dart  
 ┃ ┃ ┃ ┗ app_localization.dart  
 ┃ ┃ ┣ providers  
 ┃ ┃ ┣ routes  
 ┃ ┃ ┃ ┣ app_pages.dart  
 ┃ ┃ ┃ ┗ app_routes.dart  
 ┃ ┃ ┣ utils  
 ┃ ┃ ┃ ┣ app_constants.dart  
 ┃ ┃ ┃ ┣ assets.dart  
 ┃ ┃ ┃ ┗ sized_box_extensions.dart  
 ┃ ┃ ┗ widgets  
 ┣ features  
 ┃ ┣ cart  
 ┃ ┃ ┣ bindings  
 ┃ ┃ ┃ ┗ cart_binding.dart  
 ┃ ┃ ┣ controller  
 ┃ ┃ ┃ ┗ cart_controller.dart  
 ┃ ┃ ┗ cart_screen.dart  
 ┃ ┣ categories  
 ┃ ┃ ┣ bindings  
 ┃ ┃ ┃ ┗ categories_binding.dart  
 ┃ ┃ ┣ controller  
 ┃ ┃ ┃ ┗ categories_controller.dart  
 ┃ ┃ ┗ categories_screen.dart  
 ┃ ┣ favorites  
 ┃ ┃ ┣ bindings  
 ┃ ┃ ┃ ┗ favorites_binding.dart  
 ┃ ┃ ┣ controller  
 ┃ ┃ ┃ ┗ favorites_controller.dart  
 ┃ ┃ ┣ widgets  
 ┃ ┃ ┃ ┗ favorites_appbar.dart  
 ┃ ┃ ┗ favorites_screen.dart  
 ┃ ┣ home  
 ┃ ┃ ┣ bindings  
 ┃ ┃ ┃ ┗ home_binding.dart  
 ┃ ┃ ┣ controller  
 ┃ ┃ ┃ ┗ home_controller.dart  
 ┃ ┃ ┣ widgets  
 ┃ ┃ ┃ ┣ contact_us.dart  
 ┃ ┃ ┃ ┣ home_appbar.dart  
 ┃ ┃ ┃ ┣ home_discounts.dart  
 ┃ ┃ ┃ ┣ home_section_text.dart  
 ┃ ┃ ┃ ┣ installment_section.dart  
 ┃ ┃ ┃ ┣ offer_section.dart  
 ┃ ┃ ┃ ┣ popular_categories.dart  
 ┃ ┃ ┃ ┗ popular_products.dart  
 ┃ ┃ ┗ home_screen.dart  
 ┃ ┣ product_detail  
 ┃ ┃ ┣ bindings  
 ┃ ┃ ┃ ┗ product_detail_binding.dart  
 ┃ ┃ ┣ controller  
 ┃ ┃ ┃ ┗ product_detail_controller.dart  
 ┃ ┃ ┣ widgets  
 ┃ ┃ ┗ product_detail_screen.dart  
 ┃ ┣ product_list_screen  
 ┃ ┃ ┣ bindings  
 ┃ ┃ ┃ ┗ product_list_binding.dart  
 ┃ ┃ ┣ controller  
 ┃ ┃ ┃ ┗ product_list_controller.dart  
 ┃ ┃ ┣ widgets  
 ┃ ┃ ┃ ┗ product_list_appbar.dart  
 ┃ ┃ ┗ product_list_screen.dart  
 ┃ ┣ profile  
 ┃ ┃ ┣ bindings  
 ┃ ┃ ┃ ┗ profile_binding.dart  
 ┃ ┃ ┣ controller  
 ┃ ┃ ┃ ┗ profile_controller.dart  
 ┃ ┃ ┗ profile_screen.dart  
 ┃ ┣ splash  
 ┃ ┃ ┗ splash_screen.dart  
 ┃ ┗ navigation_menu.dart  
 ┣ generated  
 ┃ ┗ assets.dart  
 ┣ firebase_options.dart  
 ┗ main.dart
