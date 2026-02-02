part of 'widgets.dart';

class DefaulImportanttField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  const DefaulImportanttField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            hintText: hint,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the $label';
            }
            return null;
          },
        ),
      ],
    );
  }
}

//password field
class DefaultPasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  const DefaultPasswordField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isPasswordVisible = true.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Obx(
          () => TextFormField(
            controller: controller,
            obscureText: isPasswordVisible.value,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  isPasswordVisible.value = !isPasswordVisible.value;
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              hintText: hint,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the $label';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
