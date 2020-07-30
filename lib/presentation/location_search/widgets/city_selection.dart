import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// This widget build the input field which allows the user to search
/// for a location to receive its weather data.
class CitySelection extends StatelessWidget {
  final TextEditingController _tec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container();
    // return BlocBuilder<WeatherBloc, WeatherState>(
    //     // buildWhen: (previous, current) => previous.city != current.city,
    //     builder: (context, state) {
    //   return Form(
    //     autovalidate: state.showErrorMessages,
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.only(left: 10.0),
    //             child: TextFormField(
    //               controller: _tec,
    //               key: const Key('__Location_Search_Text_Form_Field__'),
    //               decoration: const InputDecoration(
    //                 labelText: 'City',
    //                 hintText: 'Chicago',
    //               ),
    //               onChanged: (value) {
    //                 _tec.text = value;
    //                 context.bloc<WeatherBloc>().add(
    //                       WeatherEvent.cityChanged(value),
    //                     );
    //               },
    //               validator: (_) =>
    //                   context.bloc<WeatherBloc>().state.city.value.fold(
    //                         (f) => f.maybeMap(
    //                           empty: (f) => 'Cannot be empty',
    //                           orElse: () => null,
    //                         ),
    //                         (_) => null,
    //                       ),
    //             ),
    //           ),
    //         ),
    //         IconButton(
    //           key: const Key('__Location_Search_Icon_Button__'),
    //           icon: const Icon(Icons.search),
    //           onPressed: () {
    //             context
    //                 .bloc<WeatherBloc>()
    //                 .add(WeatherEvent.fetchWeatherForLocationWithQuery(
    //                   cityStr: _tec.text,
    //                   requestTime: DateTime.now(),
    //                 ));
    //             if (_tec.text.isNotEmpty) {
    //               ExtendedNavigator.root.pop();
    //             }
    //           },
    //         )
    //       ],
    //     ),
    //   );
    // });
  }
}
