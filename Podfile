# ================================== Podfile ==================================
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

platform :ios, '13.0'
source 'https://cdn.cocoapods.org/'
use_frameworks! :linkage => :static
inhibit_all_warnings!

# 给 Podfile.deps 里调用的公共钩子（可为空）
def cocoPodsConfig
  # 全局追加 Pod / Script Phases 可写在这里；留空不报错
end

# ===== 加载同级 Podfile.deps（拆分主体）=====
deps_path = File.join(__dir__, 'Podfile.deps')
raise "[Podfile] 找不到 #{deps_path}" unless File.exist?(deps_path)
instance_eval(File.read(deps_path), deps_path, 1)

# ===== 统一工程设置 + 让 Podfile.deps 在 Xcode 可见并高亮为 Ruby =====
post_install do |installer|
  # 1) 宿主 App 工程：统一构建设置
  installer.aggregate_targets.each do |agg|
    user_project = agg.user_project
    user_project.native_targets.each do |t|
      t.build_configurations.each do |cfg|
        cfg.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'
        cfg.build_settings['IPHONEOS_DEPLOYMENT_TARGET']    = '13.0'
      end
    end
    user_project.save
  end

  # 2) Pods 工程：统一最低系统版本
  pods_project = installer.pods_project
  pods_project.targets.each do |t|
    t.build_configurations.each do |cfg|
      cfg.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end

  # 3) 在 Pods 分组里挂上 Podfile.deps，并强制识别为 Ruby（语法高亮）
  main_group   = pods_project.main_group
  deps_relpath = '../Podfile.deps'  # 相对 Pods.xcodeproj 的路径
  file_ref = main_group.find_file_by_path(deps_relpath) || main_group.new_file(deps_relpath)
  if file_ref.respond_to?(:explicit_file_type=)
    file_ref.explicit_file_type = 'text.script.ruby'
  end
  pods_project.save
end
