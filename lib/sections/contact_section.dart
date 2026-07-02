import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import '../widgets/common/section_header.dart';
import '../widgets/common/gradient_button.dart';
import '../widgets/common/glass_card.dart';
import '../widgets/animations/fade_in_widget.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final subject = Uri.encodeComponent('Project Inquiry from ${_nameController.text}');
      final body = Uri.encodeComponent(_messageController.text);
      final uri = Uri.parse('mailto:${AppConstants.email}?subject=$subject&body=$body');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = AppSpacing.sectionPadding(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: padding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidth),
          child: Column(
            children: [
              const SectionHeader(
                badge: 'Contact',
                title: 'Start Your\nProject Today',
                subtitle:
                    'Ready to build something remarkable? Reach out to discuss '
                    'your project requirements.',
              ),
              const SizedBox(height: 48),
              isMobile
                  ? Column(
                      children: [
                        _buildContactInfo(context, isDark),
                        const SizedBox(height: 32),
                        _buildForm(context, isDark),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildContactInfo(context, isDark),
                        ),
                        const SizedBox(width: 48),
                        Expanded(
                          flex: 3,
                          child: _buildForm(context, isDark),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isDark) {
    return FadeInWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            'OneView is always open to discussing new projects, partnerships, '
            'and opportunities to build impactful digital products.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          _ContactInfoItem(
            icon: Icons.email_outlined,
            label: 'Email',
            value: AppConstants.email,
            onTap: () => launchUrl(Uri.parse('mailto:${AppConstants.email}')),
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _ContactInfoItem(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: AppConstants.location,
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _ContactInfoItem(
            icon: Icons.work_outline,
            label: 'LinkedIn',
            value: 'Coming Soon',
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, bool isDark) {
    return FadeInWidget(
      delay: const Duration(milliseconds: 200),
      child: GlassCard(
        padding: const EdgeInsets.all(32),
        enableHover: false,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Your name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'you@company.com',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  hintText: 'Tell us about your project...',
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              GradientButton(
                text: 'Send Message',
                onPressed: _submitForm,
                icon: Icons.send_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool isDark;

  const _ContactInfoItem({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final content = Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: isDark ? 0.15 : 0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: onTap != null ? AppColors.primary : null,
                  ),
            ),
          ],
        ),
      ],
    );

    if (onTap != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: content,
        ),
      );
    }
    return content;
  }
}
