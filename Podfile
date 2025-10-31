# ================================== Podfile ==================================
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

# ⚠️ 与 post_install 保持一致
platform :ios, '15.6'

source 'https://cdn.cocoapods.org/'

# 关键：恢复这段，避免 Assets.car 重复产物冲突
install! 'cocoapods',
  :deterministic_uuids => false,
  :disable_input_output_paths => true
# 如需的话，你也可以加上（可选）:
# , :generate_multiple_pod_projects => false

use_frameworks! :linkage => :static
inhibit_all_warnings!

# 预留钩子，给 Podfile.deps 调用
def cocoPodsConfig
  # 按需扩展
end

# 加载拆分出来的依赖定义
deps_path = File.join(__dir__, 'Podfile.deps')
unless File.exist?(deps_path)
  raise "[Podfile] ❌ 找不到 #{deps_path}，请确认 Podfile.deps 存在于工程根目录"
end
instance_eval(File.read(deps_path), deps_path, 1)

# 统一工程设置 & 把 Podfile.deps 显示到 Pods 分组里
post_install do |installer|
  # -------- 1. 宿主 App 工程设置 --------
  installer.aggregate_targets.each do |agg|
    user_project = agg.user_project
    user_project.native_targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
    user_project.save
  end

  # -------- 2. Pods 工程最低系统版本统一 --------
  pods_project = installer.pods_project
  pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end

  # -------- 3. 在 Pods 分组里展示 Podfile.deps（Ruby 语法高亮） --------
  main_group   = pods_project.main_group
  deps_relpath = '../Podfile.deps'
  file_ref = main_group.find_file_by_path(deps_relpath) || main_group.new_file(deps_relpath)
  if file_ref.respond_to?(:explicit_file_type=)
    file_ref.explicit_file_type = 'text.script.ruby'
  end
  pods_project.save
end
