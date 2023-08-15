import 'package:get/get.dart';
import 'package:pet_patner_demo/network/remote/Requests/add_offering_user_request.dart';
import '../models/pet.dart';
import '../models/response_helper.dart';
import '../models/service.dart';
import '../models/user.dart';
import '../network/remote/Requests/create_service_request.dart';
import '../network/remote/Requests/login_request.dart';
import '../network/remote/Requests/signup_request.dart';
import '../network/remote/Requests/create_pet_request.dart';
import '../network/services/ApiService.dart';

class ApiController extends GetxController {
  var isLoading = false.obs;
  var status = true.obs;
  var error = ''.obs;
  var user = User().obs;
  var pets = <Pet>[].obs;
  var services = <Service>[].obs;

  Future<ResponseHelper> loginUser(String email, String password) async {
    isLoading.value = true;
    try {
      var loggedInUser = await ApiService.login(LoginRequest(
        email: email,
        password: password,
      ));
      user.value = loggedInUser;
    } catch (e) {
      error.value = 'Error logging in';
    }

    isLoading.value = false;

    if (user.value.email == null) {
      status.value = false;
      return ResponseHelper(status: false, isLoading: isLoading.value);
    }

    status.value = true;
    return ResponseHelper(status: true, isLoading: isLoading.value);
  }

  Future<ResponseHelper> signUpUser(
    String fullName,
    String email,
    String gender,
    String role,
    String phone,
    String password,
  ) async {
    isLoading.value = true;
    try {
      var signUpRequest = new SignUpRequest(
          fullName: fullName,
          email: email,
          phone: phone,
          password: password,
          gender: gender,
          role: role);
      var signUpUser = await ApiService.signUp(signUpRequest);
      user.value = signUpUser;
    } catch (e) {
      error.value = 'Error signing up';
    } finally {
      isLoading.value = false;
    }

    if (user.value.email == null) {
      status.value = false;
      return ResponseHelper(status: false, isLoading: isLoading.value);
    }

    status.value = true;
    return ResponseHelper(status: true, isLoading: isLoading.value);

  }

  Future<bool> addPet(CreatePetRequest createPetRequest) async {
    isLoading.value = true;
    try {
      var pet = await ApiService.addPet(createPetRequest);
      pets.add(pet);
    } catch (e) {
      error.value = 'Error adding pet';
    } finally {
      isLoading.value = false;
    }

    return isLoading.value;
  }

  Future<void> fetchUserPets(String userEmail) async {
    isLoading.value = true;
    try {
      pets.clear();
      var userPets = await ApiService.findAllUserPets(userEmail);
      pets.addAll(userPets);
      print("Fetched pets: ${pets.length}");
    } catch (e) {
      error.value = 'Error fetching user pets: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUserServices(String userEmail) async {
    isLoading.value = true;
    try {
      var userServices = await ApiService.findUserServices(userEmail);
      services.value = userServices;
    } catch (e) {
      error.value = 'Error fetching user services';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addOfferingUser(AddOfferingUserRequest addOfferingUserRequest) async {
    isLoading.value = true;
    try {
      var service = await ApiService.addOfferingUser(addOfferingUserRequest);
      services.add(service);
    } catch (e) {
      error.value = 'Error adding service';
    } finally {
      isLoading.value = false;
    }
  }
// Add more methods as needed for other API requests
}
