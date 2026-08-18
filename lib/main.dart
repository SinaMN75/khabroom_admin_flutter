import "package:u/utilities.dart";

void main() => runUAdminApp(
  UAdminConfig(
    appName: "KhabRoom",
    baseUrl: "https://api.khabroom.com/api",
    apiKey: "123",
    primaryColor: Colors.red.shade800,
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
          UAdminModules.dormRooms(roles: <TagUser>[TagUser.systemAdmin, TagUser.superAdmin]),
          UAdminModules.dormBeds(roles: <TagUser>[TagUser.systemAdmin, TagUser.superAdmin]),
          UAdminModules.contracts(roles: <TagUser>[TagUser.systemAdmin, TagUser.superAdmin]),
          UAdminModules.invoices(roles: <TagUser>[TagUser.systemAdmin, TagUser.superAdmin]),
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
        header: U.s.payment.toUpperCase(),
        title: U.s.payment,
        icon: Icons.account_balance_outlined,
        modules: <UAdminModule>[UAdminModules.wallet(), UAdminModules.transactions(), UAdminModules.accounting()],
      ),
      UAdminGroup(
        title: U.s.content,
        icon: Icons.content_copy_outlined,
        roles: <TagUser>[TagUser.systemAdmin, TagUser.superAdmin],
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
          UAdminModules.apiLogs(roles: <TagUser>[TagUser.systemAdmin]),
        ],
      ),
    ],
  ),
);
