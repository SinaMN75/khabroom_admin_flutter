import "package:u/utilities.dart";

void main() => runUAdminApp(
  UAdminConfig(
    appName: "SinaMN75",
    baseUrl: "https://api.sinamn75.com/api",
    apiKey: "123",
    primaryColor: const Color.fromRGBO(50, 48, 221, 1),
    logo: "lib/assets/images/logo.png",
    loginBackground: "lib/assets/images/login_background.jpg",
    dashboard: () => UAdminModules.propertyDashboard(),
    menu: () => <UAdminGroup>[
      UAdminGroup(
        title: U.s.dashboard,
        icon: Icons.dashboard_rounded,
        modules: <UAdminModule>[
          UAdminModules.propertyDashboard(),
        ],
      ),
      UAdminGroup(
        header: U.s.accommodation.toUpperCase(),
        title: U.s.hotels,
        icon: Icons.apartment_outlined,
        roles: <TagUser>[TagUser.permissionManageHotels],
        modules: <UAdminModule>[
          UAdminModules.hotels(),
          UAdminModules.hotelRooms(),
          UAdminModules.reservations(),
        ],
      ),
      UAdminGroup(
        title: U.s.dorms,
        icon: Icons.bedroom_parent_outlined,
        roles: <TagUser>[TagUser.permissionManageDorms],
        modules: <UAdminModule>[
          UAdminModules.dorms(),
          UAdminModules.dormRooms(),
          UAdminModules.dormBeds(),
          UAdminModules.contracts(),
          UAdminModules.invoices(),
        ],
      ),
      UAdminGroup(
        header: U.s.users.toUpperCase(),
        title: U.s.users,
        icon: Icons.people_outline_rounded,
        roles: <TagUser>[TagUser.permissionManageUsers],
        modules: <UAdminModule>[UAdminModules.users()],
      ),
      UAdminGroup(
        title: U.s.content,
        icon: Icons.content_copy_outlined,
        modules: <UAdminModule>[
          UAdminModules.blogs(),
          UAdminModules.contents(),
        ],
      ),
      UAdminGroup(
        title: U.s.settings,
        icon: Icons.settings_rounded,
        roles: <TagUser>[TagUser.superAdmin, TagUser.systemAdmin],
        modules: <UAdminModule>[
          UAdminModules.appSettings(roles: <TagUser>[TagUser.systemAdmin]),
          UAdminModules.fileManager(roles: <TagUser>[TagUser.systemAdmin]),
          UAdminModules.settings(),
          UAdminModules.apiLogs(),
        ],
      ),
    ],
  ),
);
