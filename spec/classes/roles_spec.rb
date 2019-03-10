require 'spec_helper'

describe 'roles' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it { is_expected.to contain_class('roles') }
      
      context 'with vgWAS volume group' do
        let(:params) do
          {
            'volume_groups' => {
              'vgWAS' => {
                'physical_volumes' => ['/dev/sdb'],
                'logical_volumes' => {
                  'webspherevol1' => {
                    'size' => '16G',
                    'mountpath' => '/usr/WebSphere1',
                    'mountpath_require' => false,
                  },
                  'webvol' => {
                    'size' => '16G',
                    'mountpath' => '/web',
                    'mountpath_require' => false,
                  },
                  'weblogsvol' => {
                    'size' => '16G',
                    'mountpath' => '/web/logs',
                    'mountpath_reuire' => false,
                  },
                  'installmanagervol' => {
                    'size' => '8G',
                    'mountpath' => '/usr/InstallationManager',
                    'mountpath_require' => false,
                  },
                },
              },
            },
          }
        end

        # Test Volume Group
        it do
          is_expected.to contain_volume_group('vgWAS').with(
            'physical_volumes' => ['/dev/sdb'],
          )
        end

        # Test Logical Volumes
        it do
          is_expected.to contain_logical_volume('websphere1vol').with(
            'volume_group' => 'vgWAS',
            'size' => '16G',
            'mountpath' => '/usr/WebSphere1',
            'mountpath_require' => false,
          )

          is_expected.to contain_logical_volume('webvol').with(
            'volume_group' => 'vgWAS',
            'size' => '16G',
            'mountpath' => '/web',
            'mountpath_require' => false,
          )

          is_expected.to contain_logical_volume('weblogsvol').with(
            'volume_group' => 'vgWAS',
            'size' => '16G',
            'mountpath' => '/web/logs',
            'mountpath_require' => false,
          )

          is_expected.to contain_logical_volume('instmanagervol').with(
            'volume_group' => 'vgWAS',
            'size' => '8G',
            'mountpath' => '/usr/InsatllationManager',
            'mountpath_require' => false,
          )
        end

        it do
          is_expected.to contain_filesystem('/dev/vgWAS/websphere1vol').with('fs_type' => 'xfs')
          is_expected.to contain_filesystem('/dev/vgWAS/webvol').with('fs_type' => 'xfs')
          is_expected.to contain_filesystem('/dev/vgWAS/weblogsvol').with('fs_type' => 'xfs')
          is_expected.to contain_filesystem('/dev/vgWAS/instmanagervol').with('fs_type' => 'xfs')
        end

        # Test Mounts
        it do
          is_expected.to contain_mount('/usr/WebSphere1').with(
            'ensure' => 'present',
            'fstype' => 'xfs',
            'pass'   => 0,
            'dump'   => 0,
          )

          is_expected.to contain_mount('/web').with(
            'ensure' => 'present',
            'fstype' => 'xfs',
            'pass'   => 0,
            'dump'   => 0,
          )

          is_expected.to contain_mount('/weblogs').with(
            'ensure' => 'present',
            'fstype' => 'xfs',
            'pass'   => 0,
            'dump'   => 0,
          )

          is_expected.to contain_mount('/usr/InstallationManager').with(
            'ensure' => 'present',
            'fstype' => 'xfs',
            'pass'   => 0,
            'dump'   => 0,
          )
        end
      end

      context 'with vgapp volume group' do
        let(:params) do
          {
            'volume_groups' => {
              'vgapp' => {
                'physical_volumes' => ['/dev/sdb'],
                'logical_volumes' => {
                  '/usr/HTTPServer1' => {
                    'size' => '8G',
                    'mountpath' => '/usr/HTTPServer1',
                    'mountpath_require' => false,
                  },
                  '/web' => {
                    'size' => '8G',
                    'mountpath' => '/web',
                    'mountpath_require' => false,
                  },
                  '/web/logs' => {
                    'size' => '8G',
                    'mountpath' => '/web/logs',
                    'mountpath_reuire' => false,
                  },
                  '/usr/InstallationManager' => {
                    'size' => '4G',
                    'mountpath' => '/usr/InstallationManager',
                    'mountpath_require' => false,
                  },
                  'www' => {
                    'size' => '4G',
                    'mountpath' => '/www',
                    'mountpath_require' => false,
                  },
                },
              },
            },
          }
        end

        it do
          is_expected.to contain_volume_group('vgapp').with(
            'physical_volumes' => ['/dev/sdb'],
          )
        end
      end
    end
  end
end
