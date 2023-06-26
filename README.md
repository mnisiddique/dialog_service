# dialog_service
A flutter package that aims to simplify clean usage of alert and bottomsheet dailog.

- 1. No need to invoke showDialog and showBottomsheet each time 
     alert and bottomsheet dialog requires to show.
- 2. Writing the content of dialog (alert and bottomsheet) is enough.
- 3. Default dialog properties are configurable.
- 4. Any object can be returned from alert and bottomsheet.
- 5. Default implementation of dialog showing mechanism is modifiable/extendable.

# To use the package depend on it

  `dialog_service:
    git:
      url: https://github.com/mnisiddique/dialog_service.git
      ref: v0.0.1`

# Import it
`import 'package:dialog_service/dialog_service.dart';`

# Use it like below

`
class ConfirmationAlert extends AppAlert {
  @override
  AlertDialog build() {
    return const AlertDialog(
      title: Text(kLabelAreYoySure),
      content: Text(_kWantToConfirm),
      titleTextStyle: titleStyle,
      contentTextStyle: contentStyle,
      contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 16.0),
      titlePadding: EdgeInsets.only(left: 16.0, top: 20.0),
      actions: [
        NegativeActionButton(text: _kLabelNo),
        PositiveActionButton(text: _kLabelYes),
      ],
    );
  }
}

const _kWantToConfirm = "You want to confirm?";
const _kLabelNo = "No";
const _kLabelYes = "Yes";

AlertService alertService = AlertServiceImpl()
 
 final isConfirmed = await alertService.showAlert<bool>(
      context,
      ConfirmationAlert(),
    );
 `
 
[Complete example](https://github.com/mnisiddique/dialog_service/tree/main/example)
